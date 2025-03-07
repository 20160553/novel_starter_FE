import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/providers/repositories/work_respoitory_provider.dart';
import 'package:novel_starter/usecases/work/get_work_usecase.dart';

final getWorkFirebaseUsecaseProvider = Provider<GetWorkUsecase>((ref) {
  final workRepository = ref.watch(workRepositoryFirestoreProvider);
  return GetWorkUsecase(workRepository);
});