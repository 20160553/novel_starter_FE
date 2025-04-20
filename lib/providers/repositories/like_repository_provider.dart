import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/repositories/like_repository.dart';
import 'package:novel_starter/repositories/like_repository_firestore.dart';

final likeRepositoryFirestoreProvider = Provider<LikeRepository>((ref) {
  final firestore = FirebaseFirestore.instance;
  return LikeRepositoryFirestore(firestore);
},);