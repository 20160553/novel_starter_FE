import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:novel_starter/models/work_content.dart';
import 'package:novel_starter/repositories/notice_repository.dart';
import 'package:novel_starter/utils/utils.dart';

class NoticeRepositoryFirestore implements NoticeRepository {
  NoticeRepositoryFirestore(this._firestore);

  final FirebaseFirestore _firestore;
  late final _noticeRef = _firestore.collection('notices');

  @override
  Future<void> createNotice(Notice notice) async {
    try {
      logger.d("hi");
      return _noticeRef.doc(notice.noticeId).set(notice.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteNotice(Notice notice) async {
    // TODO: implement deleteNotice
    throw UnimplementedError();
  }

  @override
  Future<List<Notice>> getNoticesbyWorkId(String workId) async {
    // TODO: implement getNoticesbyWorkId
    throw UnimplementedError();
  }

  @override
  Future<void> updateNotice(Notice notice) async {
    // TODO: implement updateNotice
    throw UnimplementedError();
  }
}
