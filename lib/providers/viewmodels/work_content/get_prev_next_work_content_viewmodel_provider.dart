import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/models/api_state.dart';
import 'package:novel_starter/models/work_content.dart';
import 'package:novel_starter/providers/usecases/episode/get_episode_usecase_provider.dart';
import 'package:novel_starter/providers/usecases/notice/get_notice_usecase_provider.dart';
import 'package:novel_starter/usecases/episode/get_episode_usecase.dart';
import 'package:novel_starter/usecases/episode/get_notice_usecase.dart';
import 'package:novel_starter/viewmodels/work_content/get_prev_next_work_content_viewmodel.dart';

final getPrevNextWorkContentViewModelProvider = StateNotifierProvider<GetPrevNextWorkContentViewModel, ApiState<List<WorkContent?>?>>((ref) {
  final GetEpisodeUsecase getEpisodeUsecase = ref.read(getEpisodeFirestoreUsecaseProvider);
  final GetNoticeUsecase getNoticeUsecase = ref.read(getNoticeFirestoreUsecaseProvider);

  return GetPrevNextWorkContentViewModel(getEpisodeUsecase, getNoticeUsecase);
});