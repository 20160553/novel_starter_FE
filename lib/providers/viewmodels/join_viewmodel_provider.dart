import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/models/api_state.dart';
import 'package:novel_starter/models/join_result.dart';
import 'package:novel_starter/providers/usecases/user/join_usecase_provider.dart';
import 'package:novel_starter/usecases/join_usecase.dart';
import 'package:novel_starter/viewmodels/join_viewmodel.dart';

final joinViewModelProvider = StateNotifierProvider<JoinViewModel, ApiState<JoinResult?>>((ref) {
  // final JoinUsecase joinUsecase = ref.watch(joinUsecaseProvider);
  final JoinUsecase joinUsecase = ref.watch(joinUsecaseFirestoreProvider);
  return JoinViewModel(joinUsecase);
});