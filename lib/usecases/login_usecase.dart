import 'package:novel_starter/models/user.dart';
import 'package:novel_starter/repositories/user_repository.dart';

class LoginUsecase {
  final UserRepository repository;

  LoginUsecase(this.repository);

  Future<User> execute(String username, String password) async {
    return await repository.login(username, password);
  }
}
