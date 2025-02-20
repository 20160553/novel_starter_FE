import 'package:novel_starter/repositories/join_repository.dart';

class JoinUsecase {
  JoinUsecase(this.joinRepository);

  final JoinRepository joinRepository;

  Future<void> execute(String username, String password) async {
    return await joinRepository.join(username, password);
  } 

  Future<bool> duplicatedCheck(String username) async {
    return await joinRepository.duplicatedCheck(username);
  }
}