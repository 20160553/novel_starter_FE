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
  late final favoriteRef = _firestore.collection("favorites");

  Future<int> _getFavoriteCount(Work work) async {
    try {
      final favoriteCountResult = await favoriteRef.where("workId", isEqualTo: work.workId).count().get();
      return favoriteCountResult.count ?? 0;
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
    
    return await Future.wait(works.map((work) async{
      int favoriteCount = await _getFavoriteCount(work);
      return work.copyWith(favoriteCount: favoriteCount);
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
    WorkEntity? workEntity = null;
    int favoriteCount = 0;

    try {
      final workResult = await worksRef.doc(workId).get();
      final favoriteCountResult = await favoriteRef.where("workId", isEqualTo: workId).count().get();
      
      data = workResult.data();
      workEntity = data == null ? null : WorkEntity.fromJson(data);
      favoriteCount = favoriteCountResult.count ?? 0;
    } catch (e) {
      rethrow;
    }
    if (workEntity == null) return null;
    Work work = Work.fromJson(workEntity.toJson());
    return work.copyWith(favoriteCount: await _getFavoriteCount(work));
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
    return await Future.wait(works.map((work) async{
      int favoriteCount = await _getFavoriteCount(work);
      return work.copyWith(favoriteCount: favoriteCount);
    }));
  }
  
}
