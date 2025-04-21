import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/models/api_state.dart';
import 'package:novel_starter/models/work_content.dart';
import 'package:novel_starter/usecases/episode/get_episode_usecase.dart';
import 'package:novel_starter/usecases/episode/get_notice_usecase.dart';

class GetPrevNextWorkContentViewModel
    extends StateNotifier<ApiState<List<WorkContent?>?>> {
  GetPrevNextWorkContentViewModel(
      this._getEpisodeUsecase, this._getNoticeUsecase)
      : super(SuccessState(data: null));

  final GetEpisodeUsecase _getEpisodeUsecase;
  final GetNoticeUsecase _getNoticeUsecase;

  void getPrevNextWorkContent(WorkContent workContent) async {
    state = ApiState.loading();
    try {
      late final List<WorkContent?> result;

      switch (workContent) {
        case Episode _:
          result = await _getEpisodeUsecase.getPrevNextEpisodes(workContent);
          break;
        case Notice _:
          result = await _getNoticeUsecase.getPrevNextNotices(workContent);
          break;
      }
      state = ApiState.success(data: result);
    } catch (e) {
      state = ApiState.error(error: e);
    }
  }
}
