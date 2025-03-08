import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/repositories/notice_repository.dart';
import 'package:novel_starter/repositories/notice_repository_firestore.dart';

final noticeRepositoryFirestoreProvider = Provider<NoticeRepository>((ref) {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  return NoticeRepositoryFirestore(firestore);
});