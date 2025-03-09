import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/models/api_state.dart';
import 'package:novel_starter/models/work_content.dart';
import 'package:novel_starter/usecases/episode/get_episode_usecase.dart';
import 'package:novel_starter/utils/utils.dart';

class GetEpisodesViewModel extends StateNotifier<ApiState<List<Episode>?>>{
  GetEpisodesViewModel(this._getEpisodeUsecase): super(ApiState.success(data: null));

  final GetEpisodeUsecase _getEpisodeUsecase;

  void getEpisodesbyWorkId(String workId) async {
    state = ApiState.loading();

    try{
      final episodes = await _getEpisodeUsecase.execute(workId);
      state = ApiState.success(data: episodes);
    } on Exception catch(e) {
      logger.e(e);
      state = ApiState.error(error: e);
    } 
    catch(e) {
      logger.e(e);
    }
  }
}