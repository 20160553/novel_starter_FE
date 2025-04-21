import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:novel_starter/models/work_content.dart';
import 'package:novel_starter/models/work_content_detail.dart';
import 'package:novel_starter/repositories/notice_repository.dart';
import 'package:novel_starter/repositories/work_content_detail_repository.dart';
import 'package:novel_starter/utils/utils.dart';

class NoticeRepositoryFirestore implements NoticeRepository {
  NoticeRepositoryFirestore(this._firestore, {
    required workContentDetailReposiotry
  }): _workContentDetailReposiotry = workContentDetailReposiotry;

  final WorkContentDetailRepository _workContentDetailReposiotry;
  final FirebaseFirestore _firestore;
  late final _noticeRef = _firestore.collection('notices');

  @override
  Future<void> createNotice(Notice notice) async {
    try {
      return _noticeRef.doc(notice.noticeId).set(notice.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> createNoticeAndDetail(Notice notice, WorkContentDetail workContentDetail) async {
    _firestore.runTransaction((transaction) async {
      createNotice(notice);
      _workContentDetailReposiotry.createWorkContentDetail(workContentDetail);
    }).then((value) {
      
    }, 
    onError: (e) {
      throw e;
    });
  }

  @override
  Future<void> deleteNotice(Notice notice) async {
    // TODO: implement deleteNotice
    throw UnimplementedError();
  }

  @override
  Future<List<Notice>> getNoticesByWorkId(String workId) async {
    List<Notice> notices = [];
    try {
      await _noticeRef.where("workId", isEqualTo: workId).orderBy('createdAt', descending: true).get().then(
        (querySnapshot) {
          for (var docSnapshot in querySnapshot.docs) {
            notices.add(Notice.fromJson(docSnapshot.data()));
          }
        },
        onError: (e) => logger.e("Logger $e"),
      );
    } catch (e) {
      rethrow;
    }
    return notices;
  }

  @override
  Future<void> updateNotice(Notice notice) async {
    // TODO: implement updateNotice
    throw UnimplementedError();
  }
  
  @override
  Future<List<Notice?>> getPrevNextNotices(Notice notice) async {
    Notice? prev, next;
    final q = _noticeRef
        .where("workId", isEqualTo: notice.workId)
        .orderBy('createdAt');
    try {
      await q.endBefore([notice.createdAt.toIso8601String()]).get().then(
            (querySnapshot) {
              if (querySnapshot.docs.isNotEmpty) {
                prev = Notice.fromJson(querySnapshot.docs[0].data());
              }
            },
            onError: (e) => logger.e("Logger $e"),
          );
      await q.startAfter([notice.createdAt.toIso8601String()])
          .get()
          .then(
            (querySnapshot) {
              if (querySnapshot.docs.isNotEmpty) {
                next = Notice.fromJson(querySnapshot.docs[0].data());
              }
            },
            onError: (e) => logger.e("Logger $e"),
          );
    } catch (e) {
      rethrow;
    }
    return [prev, next];
  }
}
