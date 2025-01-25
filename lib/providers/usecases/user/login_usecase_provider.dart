import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/providers/user_repository_provider.dart';
import 'package:novel_starter/usecases/login_usecase.dart';

final loginUseCaseProvider = Provider<LoginUsecase>((ref) {
  final userRepository = ref.watch(userRepositoryProvider);
  return LoginUsecase(userRepository);
});
