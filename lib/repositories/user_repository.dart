import  'package:novel_starter/models/user.dart';

abstract interface class UserRepository {
  Future<void> createUser(String username, String password);
  Future<User> login(String username, String password);
  Future<User> getUser(String accessToken, int id);
}