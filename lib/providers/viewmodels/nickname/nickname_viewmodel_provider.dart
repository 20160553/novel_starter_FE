import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/models/api_state.dart';
import 'package:novel_starter/providers/usecases/user/get_user_usecase_provider.dart';
import 'package:novel_starter/usecases/get_user_usecase.dart';
import 'package:novel_starter/viewmodels/user/nickname_viewmodel.dart';

final nicknameViewModelProvider = StateNotifierProvider<NicknameViewModel, ApiState<bool?>>((ref) {
  final GetUserUseCase getUserUseCase = ref.read(getUserUsecaseProvider);
  return NicknameViewModel(getUserUseCase);
});