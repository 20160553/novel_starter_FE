import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/providers/repositories/work_content_detail_repository_provider.dart';
import 'package:novel_starter/repositories/notice_repository.dart';
import 'package:novel_starter/repositories/notice_repository_firestore.dart';

final noticeRepositoryFirestoreProvider = Provider<NoticeRepository>((ref) {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final workContentDetailRepository = ref.read(workContentDetailRepositoryFirestoreProvider);
  return NoticeRepositoryFirestore(firestore, workContentDetailReposiotry: workContentDetailRepository);
});