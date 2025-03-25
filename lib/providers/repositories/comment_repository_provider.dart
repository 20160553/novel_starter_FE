import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/repositories/comment_repository.dart';
import 'package:novel_starter/repositories/comment_repository_firestore.dart';

final commentRepositoryFirestoreProvider = Provider<CommentRepository>((ref) {
  final firestore = FirebaseFirestore.instance;
  return CommentRepositoryFirestore(firestore);
});