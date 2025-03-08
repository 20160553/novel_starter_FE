import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/providers/repositories/notice_repository_provider.dart';
import 'package:novel_starter/repositories/notice_repository.dart';
import 'package:novel_starter/usecases/notice/create_notice_usecase.dart';

final createNoticeFirestoreUsecaseProvider = Provider<CreateNoticeUsecase>((ref) {
  final NoticeRepository noticeRepository = ref.read(noticeRepositoryFirestoreProvider);
  return CreateNoticeUsecase(noticeRepository);
});