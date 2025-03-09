import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/models/api_state.dart';
import 'package:novel_starter/models/work_content.dart';
import 'package:novel_starter/providers/usecases/notice/get_notice_usecase_provider.dart';
import 'package:novel_starter/usecases/episode/get_notice_usecase.dart';
import 'package:novel_starter/viewmodels/get_notices_viewmodel.dart';

final getNoticesViewModelProvider = StateNotifierProvider<GetNoticesViewModel, ApiState<List<Notice>?>>((ref) {
  final GetNoticeUsecase getNoticeUsecase = ref.read(getNoticeFirestoreUsecaseProvider);
  return GetNoticesViewModel(getNoticeUsecase);
});