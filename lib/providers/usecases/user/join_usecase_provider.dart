import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/providers/repositories/join_repository_provider.dart';
import 'package:novel_starter/usecases/join_usecase.dart';

final joinUsecaseProvider = Provider<JoinUsecase>((ref) {
  final joinRepository = ref.watch(joinRepositoryProvider);
  return JoinUsecase(joinRepository); 
});