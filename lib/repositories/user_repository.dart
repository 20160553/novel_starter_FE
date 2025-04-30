import  'package:novel_starter/models/user.dart';

abstract interface class UserRepository {
  Future<void> logout();
  Future<bool> checkNickname(String nickname);
  Future<User> login(String email, String password);
  Future<User> getUser(String accessToken, int id);
  Future<User> updateUser(User user);
  Future<bool> deleteUser(User user);
}