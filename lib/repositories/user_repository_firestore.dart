import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:novel_starter/models/user.dart';
import 'package:novel_starter/repositories/user_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:novel_starter/utils/utils.dart';

class UserRepositoryFirestore implements UserRepository {
  UserRepositoryFirestore(this._auth, this._firestore);

  late final FirebaseAuth _auth;
  late final FirebaseFirestore _firestore;
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  late final _userRef = _firestore.collection("users");

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
      final result = await _userRef.doc(uid).get();
      return User.fromJson(result.data()!);
    } catch (e) {
      logger.e("Logger $e");
      rethrow;
    }
  }

  @override
  Future<void> logout() async {
    try {
      _auth.signOut();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> checkNickname(String nickname) async {
    bool isDuplicated = false;

    try {
      final result =
          await _userRef.where("nickname", isEqualTo: nickname).count().get();
      isDuplicated = (result.count ?? 0) > 0;
    } catch (e) {
      rethrow;
    }

    return isDuplicated;
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
