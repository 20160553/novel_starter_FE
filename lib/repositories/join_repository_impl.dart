import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:novel_starter/repositories/join_repository.dart';
import 'package:novel_starter/clients/api_client.dart';

class JoinRepositoryImpl implements JoinRepository {

  JoinRepositoryImpl(this.apiService);

  final ApiClient apiService;

  @override
  Stream<User?>? get authStateChanges => null;

  @override
  Future<void> join(String email, String password) async {
    Map<String, dynamic> requestBody = {
      'email': email,
      'password': password
    };

    try {
      await apiService.post('/user', jsonEncode(requestBody));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> duplicatedCheck(String email) async {
    try {
      final response =
          await apiService.get('/users/duplicated_check/$email');
      final bool result = response.data;
      return result;
    } catch(e) {
      rethrow;
    }
  }

}