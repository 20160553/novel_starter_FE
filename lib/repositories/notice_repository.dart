import 'package:novel_starter/models/work_content.dart';

abstract interface class NoticeRepository {
  
  Future<void> createNotice(Notice notice);
  Future<void> deleteNotice(Notice notice);
  Future<void> updateNotice(Notice notice);
  Future<List<Notice>> getNoticesByWorkId(String workId);
  
}