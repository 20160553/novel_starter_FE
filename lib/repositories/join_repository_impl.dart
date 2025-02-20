import 'dart:convert';

import 'package:novel_starter/repositories/join_repository.dart';
import 'package:novel_starter/services/api_service.dart';

class JoinRepositoryImpl implements JoinRepository {

  JoinRepositoryImpl(this.apiService);

  final ApiService apiService;

  @override
  Future<void> join(String username, String password) async {
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
  Future<bool> duplicatedCheck(String username) async {
    try {
      final response =
          await apiService.get('/users/duplicated_check/$username');
      final bool result = response.data;
      return result;
    } catch(e) {
      rethrow;
    }
  }

}