import 'package:novel_starter/models/work_content.dart';

abstract interface class EpisodeRepository {
  
  Future<void> createEpisode(Episode episode);
  Future<void> deleteEpisode(Episode episode);
  Future<void> updateEpisode(Episode episode);
  Future<List<Episode>> getEpisodesbyWorkId(String workId);
  
}