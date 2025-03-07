import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/providers/api_client_provider.dart';
import 'package:novel_starter/repositories/user_repository.dart';
import 'package:novel_starter/repositories/user_repository_firestore.dart';
import 'package:novel_starter/repositories/user_repository_impl.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  final apiService = ref.watch(apiClientProvider);
  return UserRepositoryImpl(apiService);
});

final userRepositoryFirebaseProvider = Provider<UserRepository>((ref) {
  // final apiService = ref.watch(apiClientProvider);
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  return UserRepositoryFirestore(auth, firestore);
});