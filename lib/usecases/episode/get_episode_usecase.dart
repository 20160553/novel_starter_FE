import 'package:novel_starter/models/work_content.dart';
import 'package:novel_starter/repositories/episode_repository.dart';

class GetEpisodeUsecase {
  GetEpisodeUsecase({required this.episodeRepository});
  final EpisodeRepository episodeRepository;

  Future<List<Episode>> execute(String workId) async {
    return episodeRepository.getEpisodesbyWorkId(workId);
  } 
}
