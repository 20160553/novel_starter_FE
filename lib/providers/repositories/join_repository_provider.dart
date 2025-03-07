import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/providers/api_client_provider.dart';
import 'package:novel_starter/repositories/join_repository.dart';
import 'package:novel_starter/repositories/join_repository_firestore.dart';
import 'package:novel_starter/repositories/join_repository_impl.dart';

final joinRepositoryProvider = Provider<JoinRepository>((ref) {
  final apiService = ref.watch(apiClientProvider);
  return JoinRepositoryImpl(apiService);
});

final joinRepositoryFirestoreProvider = Provider<JoinRepository>((ref) {
  return JoinRepositoryFirestore(FirebaseAuth.instance, FirebaseFirestore.instance);
});