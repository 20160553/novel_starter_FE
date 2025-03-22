import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/models/api_state.dart';
import 'package:novel_starter/models/work.dart';
import 'package:novel_starter/usecases/work/delete_work_usecase.dart';
import 'package:novel_starter/usecases/work/get_work_usecase.dart';
import 'package:novel_starter/utils/utils.dart';

class ManageWorkViewModel extends StateNotifier<ApiState<List<Work>?>> {
  ManageWorkViewModel(this._getWorkUsecase, this._deleteWorkUsecase)
      : super(ApiState.success(data: null));

  final GetWorkUsecase _getWorkUsecase;
  final DeleteWorkUsecase _deleteWorkUsecase;

  void getWorksByUserId(String userId) async {
    state = ApiState.loading();
    try {
      final result = await _getWorkUsecase.getWorksByUserUid(userId);
      state = ApiState.success(data: result);
    } on Exception catch (e) {
      logger.e("Logger4 $e");
      state = ApiState.error(error: e);
    } catch (e) {
      logger.e("Logger5 ${e}");
    }
  }

  void deleteWork(Work work) async {
    final prevData = state.when(
        loading: () => [], success: (data) => data ?? [], error: (_) => []);
    state = ApiState.loading();
    try {
      await _deleteWorkUsecase.execute(work);
      prevData.remove(work);
      state = ApiState.success(data: [...prevData]);
    } on Exception catch (e) {
      logger.e(e);
      ApiState.error(error: e);
    } catch (e) {
      logger.e(e);
    }
  }
}
