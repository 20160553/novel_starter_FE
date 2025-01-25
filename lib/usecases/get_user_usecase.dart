import 'package:novel_starter/models/user.dart';
import 'package:novel_starter/repositories/user_repository.dart';

class GetUserUseCase {
  final UserRepository repository;

  GetUserUseCase(this.repository);

  Future<User> execute(String accessToken, int id) async {
    return repository.getUser(accessToken, id);
  }
}
