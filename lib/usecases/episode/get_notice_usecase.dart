import 'package:novel_starter/models/work_content.dart';
import 'package:novel_starter/repositories/notice_repository.dart';

class GetNoticeUsecase {
  GetNoticeUsecase({required this.noticeRepository});
  final NoticeRepository noticeRepository;

  Future<List<Notice>> execute(String workId) async {
    return noticeRepository.getNoticesByWorkId(workId);
  } 
  Future<List<Notice?>> getPrevNextNotices(Notice notice) async {
    return noticeRepository.getPrevNextNotices(notice);
  }
}
