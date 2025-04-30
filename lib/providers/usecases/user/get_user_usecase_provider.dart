import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/providers/repositories/user_repository_provider.dart';
import 'package:novel_starter/usecases/get_user_usecase.dart';

final getUserUsecaseProvider = Provider<GetUserUseCase>((ref) {
  final userRepository = ref.read(userRepositoryFirebaseProvider);
  return GetUserUseCase(userRepository);
});