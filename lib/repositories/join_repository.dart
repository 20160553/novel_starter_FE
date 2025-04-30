
import 'package:novel_starter/models/user.dart';

abstract interface class JoinRepository {
  Future<void> join(User user, String password);
  Future<bool> checkEmailDuplicated(String email);
  Future<bool> checkNickname(String nickname);
}