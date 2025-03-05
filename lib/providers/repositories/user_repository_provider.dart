import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/providers/api_client_provider.dart';
import 'package:novel_starter/repositories/user_repository.dart';
import 'package:novel_starter/repositories/user_repository_impl.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  final apiService = ref.watch(apiClientProvider);
  return UserRepositoryImpl(apiService);
});