import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/providers/user_repository_provider.dart';
import 'package:novel_starter/usecases/create_user_usecase.dart';

final createUserUseCaseProvider = Provider<CreateUserUseCase>((ref) {
  final userRepository = ref.watch(userRepositoryProvider);
  return CreateUserUseCase(userRepository);
});