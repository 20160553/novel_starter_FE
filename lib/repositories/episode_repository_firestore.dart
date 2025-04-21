import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:novel_starter/models/work_content.dart';
import 'package:novel_starter/models/work_content_detail.dart';
import 'package:novel_starter/repositories/episode_repository.dart';
import 'package:novel_starter/repositories/work_content_detail_repository.dart';
import 'package:novel_starter/utils/utils.dart';

class EpisodeRepositoryFirestore implements EpisodeRepository {
  EpisodeRepositoryFirestore(this._firestore,
      {required WorkContentDetailRepository workContentDetailReposiotry})
      : _workContentDetailReposiotry = workContentDetailReposiotry;

  WorkContentDetailRepository _workContentDetailReposiotry;

  final FirebaseFirestore _firestore;
  late final _episodeRef = _firestore.collection('episodes');

  @override
  Future<void> createEpisode(Episode episode) async {
    try {
      _episodeRef.doc(episode.episodeId).set(episode.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> createEpisodeAndDetail(
      Episode episode, WorkContentDetail workContentDetail) async {
    _firestore.runTransaction((transaction) async {
      createEpisode(episode);
      _workContentDetailReposiotry.createWorkContentDetail(workContentDetail);
    }).then((value) {}, onError: (e) {
      throw e;
    });
  }

  @override
  Future<void> deleteEpisode(Episode episode) {
    // TODO: implement deleteEpisode
    throw UnimplementedError();
  }

  @override
  Future<void> updateEpisode(Episode episode) {
    // TODO: implement updateEpisode
    throw UnimplementedError();
  }

  @override
  Future<List<Episode>> getEpisodesbyWorkId(String workId) async {
    List<Episode> episodes = [];
    try {
      await _episodeRef
          .where("workId", isEqualTo: workId)
          .orderBy('createdAt', descending: true)
          .get()
          .then(
        (querySnapshot) {
          for (var docSnapshot in querySnapshot.docs) {
            episodes.add(Episode.fromJson(docSnapshot.data()));
          }
        },
        onError: (e) => logger.e("Logger $e"),
      );
    } catch (e) {
      rethrow;
    }
    return episodes;
  }

  @override
  Future<List<Episode?>> getPrevNextEpisodes(Episode episode) async {
    Episode? prev, next;
    final q = _episodeRef
        .where("workId", isEqualTo: episode.workId)
        .orderBy('createdAt');
    try {
      await q.endBefore([episode.createdAt.toIso8601String()]).get().then(
            (querySnapshot) {
              if (querySnapshot.docs.isNotEmpty) {
                prev = Episode.fromJson(querySnapshot.docs[0].data());
              }
            },
            onError: (e) => logger.e("Logger $e"),
          );
      await q.startAfter([episode.createdAt.toIso8601String()])
          .get()
          .then(
            (querySnapshot) {
              if (querySnapshot.docs.isNotEmpty) {
                next = Episode.fromJson(querySnapshot.docs[0].data());
              }
            },
            onError: (e) => logger.e("Logger $e"),
          );
    } catch (e) {
      rethrow;
    }
    return [prev, next];
  }
}
