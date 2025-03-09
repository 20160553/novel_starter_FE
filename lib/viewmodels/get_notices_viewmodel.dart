import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/models/api_state.dart';
import 'package:novel_starter/models/work_content.dart';
import 'package:novel_starter/usecases/episode/get_notice_usecase.dart';
import 'package:novel_starter/utils/utils.dart';

class GetNoticesViewModel extends StateNotifier<ApiState<List<Notice>?>> {
  GetNoticesViewModel(this._getNoticesUsecase)
      : super(ApiState.success(data: null));

  final GetNoticeUsecase _getNoticesUsecase;

  void getNoticesByWorkId(String workId) async {
    state = ApiState.loading();
    try {
      final result = await _getNoticesUsecase.execute(workId);
      state = ApiState.success(data: result);
    } on Exception catch (e) {
      logger.e(e);
      state = ApiState.error(error: e);
    } catch (e) {
      logger.e(e);
    }
  }
}
