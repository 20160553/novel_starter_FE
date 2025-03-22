import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/models/api_state.dart';
import 'package:novel_starter/models/work_content_detail.dart';
import 'package:novel_starter/usecases/work_content_detail/get_work_content_detail_usecase.dart';
import 'package:novel_starter/utils/utils.dart';

class GetWorkContentDetailViewmodel extends StateNotifier<ApiState<WorkContentDetail?>>{
  GetWorkContentDetailViewmodel(this._getWorkContentDetailUsecase): super(ApiState.success(data: null));

  final GetWorkContentDetailUsecase _getWorkContentDetailUsecase;

  void getWorkContentDetailById(String workContentDetailId) async {
    state = ApiState.loading();
    try {
      final result = await _getWorkContentDetailUsecase.execute(workContentDetailId);
      state = ApiState.success(data: result);
    } on Exception catch(e) {
      logger.e(e);
      state = ApiState.error(error: e);
      rethrow;
    } on Error catch(e) {
      logger.e(e);
      rethrow;
    }
  }
  
}