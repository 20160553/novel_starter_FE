import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/repositories/work_repository.dart';
import 'package:novel_starter/repositories/work_repository_firestore.dart';

final workRepositoryFirestoreProvider = Provider<WorkRepository>((ref) {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  return WorkRepositoryFirestore(firestore);
});