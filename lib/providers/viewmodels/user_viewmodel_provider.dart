import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/models/api_state.dart';
import 'package:novel_starter/models/user.dart';
import 'package:novel_starter/providers/usecases/user/create_user_usecase_provider.dart';
import 'package:novel_starter/providers/usecases/user/login_usecase_provider.dart';
import 'package:novel_starter/viewmodels/user_viewmodel.dart';

final userViewModelProvider = StateNotifierProvider<UserViewModel, ApiState<User?>>((ref) {
  final createUserUseCase = ref.watch(createUserUseCaseProvider);
  final loginUsecase = ref.watch(loginUseCaseProvider);

  return UserViewModel(createUserUseCase, loginUsecase);
});