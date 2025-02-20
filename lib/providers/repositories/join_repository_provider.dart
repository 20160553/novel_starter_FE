import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/providers/api_service_provider.dart';
import 'package:novel_starter/repositories/join_repository.dart';
import 'package:novel_starter/repositories/join_repository_impl.dart';

final joinRepositoryProvider = Provider<JoinRepository>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return JoinRepositoryImpl(apiService);
});
