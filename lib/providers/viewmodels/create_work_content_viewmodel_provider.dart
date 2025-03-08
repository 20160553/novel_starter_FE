import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/models/api_state.dart';
import 'package:novel_starter/models/work_content.dart';
import 'package:novel_starter/providers/usecases/episode/create_episode_usecase_provider.dart';
import 'package:novel_starter/providers/usecases/notice/create_notice_usecase_provider.dart';
import 'package:novel_starter/usecases/episode/create_episode_usecase.dart';
import 'package:novel_starter/usecases/notice/create_notice_usecase.dart';
import 'package:novel_starter/viewmodels/create_work_content_viewmodel.dart';

final createWorkContentViewModelProvider = StateNotifierProvider<CreateWorkContentViewModel, ApiState<WorkContent?>>((ref) {
  final CreateEpisodeUsecase createEpisodeUsecase = ref.read(createEpisodeFirestoreUsecaseProvider);
  final CreateNoticeUsecase createNoticeUsecase = ref.read(createNoticeFirestoreUsecaseProvider);
  return CreateWorkContentViewModel(createEpisodeUsecase, createNoticeUsecase);
});