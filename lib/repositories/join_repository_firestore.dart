import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:novel_starter/repositories/join_repository.dart';
import 'package:novel_starter/utils/utils.dart';

class JoinRepositoryFirestore implements JoinRepository {
  JoinRepositoryFirestore(this._auth, this._firestore);

  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  @override
  Stream<User?>? get authStateChanges => _auth.authStateChanges();

  @override
  Future<bool> duplicatedCheck(String email) {
    // TODO: implement duplicatedCheck
    throw UnimplementedError();
  }

  @override
  Future<void> join(String email, String password) async {
    try {
      final result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (result.user != null) {
        final user = <String, dynamic> {
          "email": email
        };
        _firestore.collection('users').doc(result.user!.uid).set(user);
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
}
