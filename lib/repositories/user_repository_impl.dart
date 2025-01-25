import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:novel_starter/repositories/user_repository.dart';
import 'package:novel_starter/models/user.dart';
import 'package:novel_starter/services/api_service.dart';
import 'package:novel_starter/utils/config.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:novel_starter/utils/utils.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this.apiService);

  final ApiService apiService;
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  @override
  Future<void> createUser(String username, String password) async {
    Map<String, dynamic> requestBody = {
      'username': username,
      'password': password
    };

    try {
      await apiService.post('/user', jsonEncode(requestBody));
    } catch (e) {
      rethrow;
    }
  }

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
      return User(id: decodedToken['id'], username: decodedToken['username']);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<User> getUser(String accessToken, int id) {
    // TODO: implement getUser
    throw UnimplementedError();
  }
}
