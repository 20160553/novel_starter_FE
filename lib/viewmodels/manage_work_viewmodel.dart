import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/models/api_state.dart';
import 'package:novel_starter/models/work.dart';
import 'package:novel_starter/usecases/work/get_work_usecase.dart';
import 'package:novel_starter/utils/utils.dart';

class ManageWorkViewmodel extends StateNotifier<ApiState<List<Work>?>> {
  ManageWorkViewmodel(this._getWorkUsecase)
      : super(ApiState.success(data: null));

  final GetWorkUsecase _getWorkUsecase;

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
}
