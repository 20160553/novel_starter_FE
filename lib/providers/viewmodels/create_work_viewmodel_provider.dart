import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/models/api_state.dart';
import 'package:novel_starter/providers/usecases/work/create_work_usecase_provider.dart';
import 'package:novel_starter/viewmodels/create_work_viewmodel.dart';

final createWorkViewModelProvider = StateNotifierProvider<CreateWorkViewModel, ApiState<Object?>>((ref) {
  final createWorkUsecase = ref.watch(createWorkFirestoreUsecaseProvider);
  return CreateWorkViewModel(createWorkUsecase);
});