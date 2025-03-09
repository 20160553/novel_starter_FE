import 'package:novel_starter/models/work.dart';

abstract interface class WorkRepository {
  Future<List<Work>> getWorksByUserId(String userId);
  Future<Work?> getWorkByWorkId(String workId);
  Future<void> createWork(Work work);
  Future<void> deleteWork(Work work);
}