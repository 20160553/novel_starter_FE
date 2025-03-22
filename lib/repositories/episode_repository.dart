import 'package:novel_starter/models/work_content.dart';
import 'package:novel_starter/models/work_content_detail.dart';

abstract interface class EpisodeRepository {
  Future<void> createEpisode(Episode episode);
  Future<void> createEpisodeAndDetail(Episode episode, WorkContentDetail workContentDetail);
  Future<void> deleteEpisode(Episode episode);
  Future<void> updateEpisode(Episode episode);
  Future<List<Episode>> getEpisodesbyWorkId(String workId);
}