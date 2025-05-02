import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/models/api_state.dart';
import 'package:novel_starter/usecases/get_user_usecase.dart';
import 'package:novel_starter/utils/utils.dart';

///SuccessState's data :
/// - null : not initialized
/// - true : the nickname is unavailable
/// - false : the nickname is available
class NicknameViewModel extends StateNotifier<ApiState<bool?>>{
  NicknameViewModel(this._getUserUseCase): super(ApiState.success(data: null));

  final GetUserUseCase _getUserUseCase;

  /// This function is nickname duplicated check function. If the nickname was used return true. else return false.
  void checkNickname(String nickname) async {

    state = ApiState.loading();
    try {
      final result = await _getUserUseCase.checkNickname(nickname);
      state = ApiState.success(data: result);
    } catch(e) {
      state = ApiState.error(error: e);
      logger.e(e);
    }
  }
}