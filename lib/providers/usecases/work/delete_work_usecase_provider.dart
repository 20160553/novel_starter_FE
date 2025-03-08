import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/providers/repositories/work_respoitory_provider.dart';
import 'package:novel_starter/repositories/work_repository.dart';
import 'package:novel_starter/usecases/work/delete_work_usecase.dart';

final deleteWorkFirestoreUsecaseProvider = Provider<DeleteWorkUsecase>((ref) {
  final WorkRepository workRepository = ref.read(workRepositoryFirestoreProvider);
  return DeleteWorkUsecase(workRepository);
});