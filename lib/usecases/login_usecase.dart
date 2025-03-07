import 'package:novel_starter/models/user.dart';
import 'package:novel_starter/repositories/join_repository.dart';
import 'package:novel_starter/repositories/user_repository.dart';

class LoginUsecase {
  LoginUsecase(this.repository);

  final UserRepository repository;

  Future<User> execute(String email, String password) async {
    return await repository.login(email, password);
  }
}
