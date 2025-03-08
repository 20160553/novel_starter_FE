import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/models/api_state.dart';
import 'package:novel_starter/models/work.dart';
import 'package:novel_starter/providers/usecases/work/delete_work_usecase_provider.dart';
import 'package:novel_starter/providers/usecases/work/get_work_usecase_provider.dart';
import 'package:novel_starter/viewmodels/manage_work_viewmodel.dart';

final manageWorkViewModelProvider = StateNotifierProvider<ManageWorkViewModel, ApiState<List<Work>?>>((ref) {
  final getWorkUsecase = ref.watch(getWorkFirebaseUsecaseProvider);
  final deleteWorkUsecase = ref.watch(deleteWorkFirestoreUsecaseProvider);
  return ManageWorkViewModel(getWorkUsecase, deleteWorkUsecase);
});