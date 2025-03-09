import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/models/api_state.dart';
import 'package:novel_starter/models/work.dart';
import 'package:novel_starter/providers/usecases/work/get_work_usecase_provider.dart';
import 'package:novel_starter/usecases/work/get_work_usecase.dart';
import 'package:novel_starter/viewmodels/work_detail_viewmodel.dart';

final workDetailViewModelProvider = StateNotifierProvider<WorkDetailViewModel, ApiState<Work?>>((ref) {
  final GetWorkUsecase getWorkUsecase = ref.read(getWorkFirebaseUsecaseProvider);
  return WorkDetailViewModel(getWorkUsecase);
});