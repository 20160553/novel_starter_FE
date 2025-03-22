import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/providers/repositories/work_content_detail_repository_provider.dart';
import 'package:novel_starter/repositories/work_content_detail_repository.dart';
import 'package:novel_starter/usecases/work_content_detail/get_work_content_detail_usecase.dart';

final getWorkContentDetailUsecaseFirestoreProvider = Provider<GetWorkContentDetailUsecase>((ref) {
  final WorkContentDetailRepository workContentDetailRepository = ref.read(workContentDetailRepositoryFirestoreProvider);
  return GetWorkContentDetailUsecase(workContentDetailRepository);
});