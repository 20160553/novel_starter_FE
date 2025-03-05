import 'package:firebase_auth/firebase_auth.dart';

abstract interface class JoinRepository {
  Stream<User?>? get authStateChanges;
  Future<void> join(String email, String password);
  Future<bool> duplicatedCheck(String email);
}