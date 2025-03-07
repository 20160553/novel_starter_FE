import  'package:novel_starter/models/user.dart';

abstract interface class UserRepository {
  Future<User> login(String email, String password);
  Future<void> logout();
  Future<User> getUser(String accessToken, int id);
}