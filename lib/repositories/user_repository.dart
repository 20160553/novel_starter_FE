import  'package:novel_starter/models/user.dart';

abstract interface class UserRepository {
  Future<User> login(String username, String password);
  Future<User> getUser(String accessToken, int id);
}