import 'package:novel_starter/repositories/user_repository.dart';

class CreateUserUseCase {
  final UserRepository repository;

  CreateUserUseCase(this.repository);

  Future<void> execute(String username, String password) async {
    return await repository.createUser(username, password);
  }
}
