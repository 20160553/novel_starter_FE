import 'package:novel_starter/models/work_content_detail.dart';

abstract interface class WorkContentDetailRepository {
  Future<void> createWorkContentDetail(WorkContentDetail workContentDetial);
  Future<void> deleteWorkContentDetail(WorkContentDetail workContentDetial);
  Future<void> updateWorkContentDetail(WorkContentDetail workContentDetial);
  Future<WorkContentDetail?> getWorkContentDetailById(String workContentDetailId);
}
