import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:novel_starter/repositories/join_repository.dart';
import 'package:novel_starter/utils/utils.dart';

class JoinRepositoryFirestore implements JoinRepository {
  JoinRepositoryFirestore(this._authInstance, this._firestoreInstance);

  final FirebaseFirestore _firestoreInstance;
  final FirebaseAuth _authInstance;

  @override
  Stream<User?>? get authStateChanges => _authInstance.authStateChanges();

  @override
  Future<bool> duplicatedCheck(String email) {
    // TODO: implement duplicatedCheck
    throw UnimplementedError();
  }

  @override
  Future<void> join(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // logger.d("Logger: $credential");
      // final user = <String, dynamic>{
      //   'email': email,
      //   'uid': credential.user?.uid,
      // };
      // if (credential.user != null) {
      //   _firestoreInstance.collection("users").add(user).then(
      //       (DocumentReference doc) =>
      //           logger.d('Logger DocumentSnapshot added with ID: ${doc.id}'));
      //   ;
      // }
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
