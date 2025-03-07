import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:novel_starter/models/user.dart';
import 'package:novel_starter/repositories/user_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:novel_starter/utils/utils.dart';

class UserRepositoryFirestore implements UserRepository {
  UserRepositoryFirestore(this._auth, this._firestore);

  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  @override
  Future<User> getUser(String accessToken, int id) {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<User> login(String email, String password) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      final uid = credential.user!.uid;
      final result = await _firestore.collection("users").doc(uid).get();
      return User(uid: credential.user!.uid, email: result['email']);
    } catch(e) {
      logger.e("Logger $e");
      rethrow;
    }
  }
  
  @override
  Future<void> logout() async {
    try {
      _auth.signOut();
    } catch(e) {
      rethrow;
    }
  }

  
}
