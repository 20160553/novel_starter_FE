import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/models/api_state.dart';
import 'package:novel_starter/models/work.dart';
import 'package:novel_starter/usecases/work/create_work_usecase.dart';
import 'package:novel_starter/utils/utils.dart';

class CreateWorkViewModel extends StateNotifier<ApiState<Object?>> {
  CreateWorkViewModel(this._createWorkUsecase)
      : super(ApiState.success(data: null));
  final CreateWorkUsecase _createWorkUsecase;

  void createWork(Work work) async {
    state = ApiState.loading();
    try {
      await _createWorkUsecase.execute(work);
      state = ApiState.success(data: true);
    } on Exception catch (e) {
      state = ApiState.error(error: e);
      logger.e(e);
    } catch (e) {
      logger.e(e);
    }
  }


}
