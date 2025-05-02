import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:novel_starter/repositories/join_repository.dart';
import 'package:novel_starter/utils/utils.dart';
import 'package:novel_starter/models/user.dart' as user_model;

class JoinRepositoryFirestore implements JoinRepository {
  JoinRepositoryFirestore(this._auth, this._firestore);

  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  late final _userRef = _firestore.collection('users');

  @override
  Future<bool> checkEmailDuplicated(String email) async {
    bool isDuplicated = false;

    try {
      final result =
          await _userRef.where("email", isEqualTo: email).count().get();
      isDuplicated = (result.count ?? 0) > 0;
    } catch (e) {
      rethrow;
    }

    return isDuplicated;
  }

  @override
  Future<void> join(user_model.User user, String password) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
        email: user.email,
        password: password,
      );
      if (result.user != null) {
        _userRef
            .doc(result.user!.uid)
            .set(user.copyWith(uid: result.user!.uid).toJson());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        logger.e('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        logger.e('The account already exists for that email.');
      }
      rethrow;
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
}
