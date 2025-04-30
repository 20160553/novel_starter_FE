import 'package:novel_starter/models/user.dart';
import 'package:novel_starter/repositories/join_repository.dart';

class JoinUsecase {
  JoinUsecase(this.joinRepository);
  final JoinRepository joinRepository;

  Future<void> execute(User user, String password) async {
    return await joinRepository.join(user, password);
  } 

  Future<bool> duplicatedCheck(String email) async {
    return await joinRepository.checkEmailDuplicated(email);
  }

  Future<bool> nicknameCheck(String nickname) async {
    return await joinRepository.checkNickname(nickname);
  }
}