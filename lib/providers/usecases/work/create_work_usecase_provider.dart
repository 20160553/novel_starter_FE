import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/providers/repositories/work_respoitory_provider.dart';
import 'package:novel_starter/usecases/work/create_work_usecase.dart';

final createWorkFirestoreUsecaseProvider = Provider<CreateWorkUsecase>((ref) {
  final workRepository = ref.watch(workRepositoryFirestoreProvider);
  return CreateWorkUsecase(workRepository);
});