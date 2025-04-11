import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/constants/integer.dart';
import 'package:novel_starter/models/api_state.dart';
import 'package:novel_starter/models/work.dart';
import 'package:novel_starter/usecases/work/get_work_usecase.dart';
import 'package:novel_starter/utils/utils.dart';

class GetWorksViewModel extends StateNotifier<ApiState<List<Work>?>> {
  GetWorksViewModel(this._getWorkUsecase) : super(ApiState.success(data: null));

  final GetWorkUsecase _getWorkUsecase;

  bool _isLast = false;

  get isLast => _isLast;

  void refresh() {
    _isLast = false;
    getWorksSortedByTime(true);
  }

  void getWorksSortedByTime(bool refreshFlag) async {
    List<Work> prevWorks = state.when(
        loading: () => [],
        success: (data) => refreshFlag || data == null ? [] : [...data],
        error: (e) => []);
    if (_isLast) return;

    state = ApiState.loading();

    try {
      final data = await _getWorkUsecase.getWorksSortedByTimeUsingWork(prevWorks.lastOrNull);
      state = ApiState.success(data: [...prevWorks, ...data]);
      _isLast = data.length < LIST_CALL_SIZE;
    } catch (e) {
      state = ApiState.error(error: e);
      logger.e(e);
    }
  }
}
