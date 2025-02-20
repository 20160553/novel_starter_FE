import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/models/api_state.dart';
import 'package:novel_starter/models/user.dart';
import 'package:novel_starter/usecases/login_usecase.dart';

class UserViewModel extends StateNotifier<ApiState<User?>> {
  UserViewModel(this._loginUsecase)
      : super(ApiState.success(data: null));

  final LoginUsecase _loginUsecase;

  void login(String username, String password) async {
    state = ApiState.loading();
    try {
      final user = await _loginUsecase.execute(username, password);
      state = ApiState.success(data: user);
    } on Exception catch (e) {
      state = ApiState.error(error: e);
    }
  }

  void logout() async {
    state = ApiState.success(data: null);
    //todo
  }
}
