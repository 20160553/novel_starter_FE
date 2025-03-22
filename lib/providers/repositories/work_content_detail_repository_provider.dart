import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/repositories/work_content_detail_repository_firestore.dart';

final workContentDetailRepositoryFirestoreProvider = Provider<WorkContentDetailRepositoryFirestore>((ref) {
  final FirebaseFirestore firesotre = FirebaseFirestore.instance;
  return WorkContentDetailRepositoryFirestore(firesotre);
});