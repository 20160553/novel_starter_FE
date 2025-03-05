import 'package:novel_starter/repositories/join_repository.dart';

class JoinUsecase {
  JoinUsecase(this.joinRepository);
  final JoinRepository joinRepository;

  Future<void> execute(String email, String password) async {
    return await joinRepository.join(email, password);
  } 

  Future<bool> duplicatedCheck(String email) async {
    return await joinRepository.duplicatedCheck(email);
  }
}