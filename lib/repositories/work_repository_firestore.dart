import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:novel_starter/constants/integer.dart';
import 'package:novel_starter/entities/work_entity.dart';
import 'package:novel_starter/models/work.dart';
import 'package:novel_starter/repositories/work_repository.dart';
import 'package:novel_starter/utils/utils.dart';

class WorkRepositoryFirestore implements WorkRepository {
  WorkRepositoryFirestore(this._firestore);

  final FirebaseFirestore _firestore;
  late final worksRef = _firestore.collection("works");
  late final episodeRef = _firestore.collection("episodes");
  late final favoriteRef = _firestore.collection("favorites");
  late final likeRef = _firestore.collection("likes");

  Future<int> _getEpisodeCount(Work work) async {
    try {
      final episodeCountResult = await episodeRef
          .where("workId", isEqualTo: work.workId)
          .count()
          .get();
      return episodeCountResult.count ?? 0;
    } catch (e) {
      rethrow;
    }
  }

  Future<int> _getFavoriteCount(Work work) async {
    try {
      final favoriteCountResult = await favoriteRef
          .where("workId", isEqualTo: work.workId)
          .count()
          .get();
      return favoriteCountResult.count ?? 0;
    } catch (e) {
      rethrow;
    }
  }

  Future<int> _getLikeCount(Work work) async {
    try {
      final likeCountResult =
          await likeRef.where("workId", isEqualTo: work.workId).count().get();
      return likeCountResult.count ?? 0;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> createWork(Work work) async {
    try {
      worksRef.doc(work.workId).set(work.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Work>> getWorksByUserId(String userId) async {
    List<Work> works = [];
    try {
      await worksRef.where("userId", isEqualTo: userId).get().then(
        (querySnapshot) {
          for (var docSnapshot in querySnapshot.docs) {
            works.add(Work.fromJson(docSnapshot.data()));
          }
        },
        onError: (e) => logger.e("Logger $e"),
      );
    } catch (e) {
      logger.e("Logger catch $e");
      rethrow;
    }

    return await Future.wait(works.map((work) async {
      int favoriteCount = await _getFavoriteCount(work);
      int likeCount = await _getLikeCount(work);
      int episodeCount = await _getEpisodeCount(work);
      return work.copyWith(
          favoriteCount: favoriteCount,
          likeCount: likeCount,
          episodeCount: episodeCount);
    }));
  }

  @override
  Future<void> deleteWork(Work work) async {
    try {
      await worksRef.doc(work.workId).delete();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Work?> getWorkByWorkId(String workId) async {
    final Map<String, dynamic>? data;
    WorkEntity? workEntity;

    try {
      final workResult = await worksRef.doc(workId).get();

      data = workResult.data();
      workEntity = data == null ? null : WorkEntity.fromJson(data);
    } catch (e) {
      rethrow;
    }
    if (workEntity == null) return null;
    Work work = Work.fromJson(workEntity.toJson());
    return work.copyWith(
        favoriteCount: await _getFavoriteCount(work),
        likeCount: await _getLikeCount(work),
        episodeCount: await _getEpisodeCount(work));
  }

  @override
  Future<List<Work>> getWorksSortedByTimeUsingWork(Work? last) async {
    List<Work> works = [];
    var query = worksRef.orderBy("updatedAt", descending: true);
    if (last != null) {
      query = query.startAfterDocument(await worksRef.doc(last.workId).get());
    }
    query = query.limit(LIST_CALL_SIZE);

    try {
      await query.get().then(
        (querySnapshot) {
          for (var docSnapshot in querySnapshot.docs) {
            works.add(Work.fromJson(docSnapshot.data()));
          }
        },
        onError: (e) => logger.e("Logger $e"),
      );
    } catch (e) {
      logger.e("Logger catch $e");
      rethrow;
    }
    return await Future.wait(works.map((work) async {
      int favoriteCount = await _getFavoriteCount(work);
      int likeCount = await _getLikeCount(work);
      int episodeCount = await _getEpisodeCount(work);
      return work.copyWith(
          favoriteCount: favoriteCount,
          likeCount: likeCount,
          episodeCount: episodeCount);
    }));
  }
}
