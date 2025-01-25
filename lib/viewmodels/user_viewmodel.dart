import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/models/user.dart';
import 'package:novel_starter/usecases/create_user_usecase.dart';
import 'package:novel_starter/usecases/login_usecase.dart';

class UserViewModel extends StateNotifier<User?> {
  
  UserViewModel(this._createUserUseCase, this._loginUsecase): super(null);

  final CreateUserUseCase _createUserUseCase;
  final LoginUsecase _loginUsecase;

  void login(String username, String password) async {
    state = await _loginUsecase.execute(username, password);
  }

  void logout() async {
    state = null;
    //todo
  }
  
}