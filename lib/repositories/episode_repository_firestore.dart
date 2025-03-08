import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:novel_starter/models/work_content.dart';
import 'package:novel_starter/repositories/episode_repository.dart';

class EpisodeRepositoryFirestore implements EpisodeRepository {
  EpisodeRepositoryFirestore(this._firestore);

  final FirebaseFirestore _firestore;
  late final episodeRef = _firestore.collection('episodes');

  @override
  Future<void> createEpisode(Episode episode) async {
    try {
      episodeRef.doc(episode.episodeId).set(episode.toJson());
    } catch (e) {
      rethrow;
    }
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
  Future<List<Episode>> getEpisodesbyWorkId(String workId) {
    // TODO: implement getEpisodesbyWorkId
    throw UnimplementedError();
  }
}
