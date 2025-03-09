import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/providers/repositories/notice_repository_provider.dart';
import 'package:novel_starter/usecases/episode/get_notice_usecase.dart';

final getNoticeFirestoreUsecaseProvider = Provider<GetNoticeUsecase>((ref) {
  final noticeRepository = ref.read(noticeRepositoryFirestoreProvider);
  return GetNoticeUsecase(noticeRepository: noticeRepository);
});
