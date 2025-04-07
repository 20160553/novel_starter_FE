import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/repositories/favorite_repository.dart';
import 'package:novel_starter/repositories/favorite_repository_firestore.dart';

final favoriteRepositoryFirestoreProvider = Provider<FavoriteRepository>((ref) {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  return FavoriteRepositoryFirestore(firestore);
});
