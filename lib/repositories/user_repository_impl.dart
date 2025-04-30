import 'dart:convert';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:novel_starter/repositories/user_repository.dart';
import 'package:novel_starter/models/user.dart';
import 'package:novel_starter/clients/api_client.dart';
import 'package:novel_starter/utils/config.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this.apiService);

  final ApiClient apiService;
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  @override
  Future<User> login(String username, String password) async {
    Map<String, dynamic> requestBody = {
      'username': username,
      'password': password
    };

    try {
      final response =
          await apiService.post('/auth/login', jsonEncode(requestBody));
      final accessToken = response.headers['authorization']![0].split(' ')[1];

      _storage.write(
        key: Config.secureStorageAccessTokenKey,
        value: accessToken,
      );

      Map<String, dynamic> decodedToken = JwtDecoder.decode(accessToken);
      return User(uid: decodedToken['uid'], email: decodedToken['username'], nickname: "");
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<User> getUser(String accessToken, int id) {
    // TODO: implement getUser
    throw UnimplementedError();
  }
  
  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
  
  @override
  Future<bool> checkNickname(String nickname) {
    // TODO: implement checkNickname
    throw UnimplementedError();
  }
  
  @override
  Future<bool> deleteUser(User user) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }
  
  @override
  Future<User> updateUser(User user) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
