import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/models/api_state.dart';
import 'package:novel_starter/models/join_result.dart';
import 'package:novel_starter/usecases/join_usecase.dart';
import 'package:novel_starter/utils/utils.dart';

class JoinViewModel extends StateNotifier<ApiState<JoinResult?>> {
  JoinViewModel(this.joinUsecase): super(ApiState.success(data: null));

  final JoinUsecase joinUsecase;

  void duplicatedCheck(String username) async {
    state = ApiState.loading();
    try {
      final result = await joinUsecase.duplicatedCheck(username);
      JoinResult data = result ? JoinResult.duplicated() : JoinResult.unDuplicated();
      state = ApiState.success(data: data);
    } on Exception catch(e) {
      state = ApiState.error(error: e);
    } catch(e) {
      logger.e(e);
    }
  }

} 