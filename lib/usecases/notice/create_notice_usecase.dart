import 'package:novel_starter/models/work_content.dart';
import 'package:novel_starter/models/work_content_detail.dart';
import 'package:novel_starter/repositories/notice_repository.dart';

class CreateNoticeUsecase {
  CreateNoticeUsecase(this._noticeRepository);

  final NoticeRepository _noticeRepository;

  Future<void> execute(Notice notice) async {
    return _noticeRepository.createNotice(notice);
  }

  Future<void> createNoticeAndDetail(Notice notice, WorkContentDetail workContentDetail) async {
    return _noticeRepository.createNoticeAndDetail(notice, workContentDetail);
  }
}