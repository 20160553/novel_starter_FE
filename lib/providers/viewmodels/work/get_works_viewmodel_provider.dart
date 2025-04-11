import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/models/api_state.dart';
import 'package:novel_starter/models/work.dart';
import 'package:novel_starter/providers/usecases/work/get_work_usecase_provider.dart';
import 'package:novel_starter/viewmodels/get_works_viewmodel.dart';

final getWorksViewModelProvider = StateNotifierProvider<GetWorksViewModel, ApiState<List<Work>?>>((ref) {
  final getWorkUsecase = ref.read(getWorkFirebaseUsecaseProvider);
  return GetWorksViewModel(getWorkUsecase);
});