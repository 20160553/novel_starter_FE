import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/repositories/episode_repository.dart';
import 'package:novel_starter/repositories/episode_repository_firestore.dart';

final episodeRepositoryFirestoreProvider = Provider<EpisodeRepository>((ref) {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  return EpisodeRepositoryFirestore(firestore);
});