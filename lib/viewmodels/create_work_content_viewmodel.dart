import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/models/api_state.dart';
import 'package:novel_starter/models/work_content.dart';
import 'package:novel_starter/usecases/episode/create_episode_usecase.dart';
import 'package:novel_starter/usecases/notice/create_notice_usecase.dart';
import 'package:novel_starter/utils/utils.dart';

class CreateWorkContentViewModel extends StateNotifier<ApiState<WorkContent?>> {
  CreateWorkContentViewModel(this._createEpisodeUsecase, this._createNoticeUsecase)
      : super(ApiState.success(data: null));

  final CreateEpisodeUsecase _createEpisodeUsecase;
  final CreateNoticeUsecase _createNoticeUsecase;

  void createWorkContent(WorkContent workContent) async {

    state = ApiState.loading();
    try {
      if (workContent is Episode) {
        await _createEpisodeUsecase.execute(workContent);
      } else if (workContent is Notice){
        await _createNoticeUsecase.execute(workContent);
      }
      state = ApiState.success(data: workContent);
    } catch (e) {
      if (e is Exception) {
        ApiState.error(error: e);
      }
      logger.e(e);
    }
  }
}
