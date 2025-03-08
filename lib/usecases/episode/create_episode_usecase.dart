import 'package:novel_starter/models/work_content.dart';
import 'package:novel_starter/repositories/episode_repository.dart';

class CreateEpisodeUsecase {
  CreateEpisodeUsecase(this._episodeRepository);
  
  final EpisodeRepository _episodeRepository;

  Future<void> execute(Episode episode) async {
    return _episodeRepository.createEpisode(episode);
  }

}