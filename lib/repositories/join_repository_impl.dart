import 'dart:convert';

import 'package:novel_starter/models/user.dart';
import 'package:novel_starter/repositories/join_repository.dart';
import 'package:novel_starter/clients/api_client.dart';

class JoinRepositoryImpl implements JoinRepository {

  JoinRepositoryImpl(this.apiService);

  final ApiClient apiService;

  @override
  Future<void> join(User user, String password) async {
    Map<String, dynamic> requestBody = {
      'email': user.email,
      'nickname': user.nickname,
      'password': password
    };

    try {
      await apiService.post('/user', jsonEncode(requestBody));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> checkEmailDuplicated(String email) async {
    try {
      final response =
          await apiService.get('/users/duplicated_check/$email');
      final bool result = response.data;
      return result;
    } catch(e) {
      rethrow;
    }
  }
  
  @override
  Future<bool> checkNickname(String nickname) {
    // TODO: implement checkNickname
    throw UnimplementedError();
  }

}