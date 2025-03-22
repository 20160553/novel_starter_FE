import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/models/api_state.dart';
import 'package:novel_starter/models/work_content_detail.dart';
import 'package:novel_starter/providers/usecases/work_content_detail/get_work_content_detail_usecase_provider.dart';
import 'package:novel_starter/usecases/work_content_detail/get_work_content_detail_usecase.dart';
import 'package:novel_starter/viewmodels/get_work_content_detail_viewmodel.dart';

final getWorkContentDetailViewmodelProvider = StateNotifierProvider<GetWorkContentDetailViewmodel, ApiState<WorkContentDetail?>>((ref) {
  final GetWorkContentDetailUsecase getWorkContentDetailUsecase = ref.read(getWorkContentDetailUsecaseFirestoreProvider);
  return GetWorkContentDetailViewmodel(getWorkContentDetailUsecase);
});