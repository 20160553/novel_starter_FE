import 'package:novel_starter/models/work_content_detail.dart';
import 'package:novel_starter/repositories/work_content_detail_repository.dart';

class GetWorkContentDetailUsecase {
  GetWorkContentDetailUsecase(this._workContentDetailRepository);
  final WorkContentDetailRepository _workContentDetailRepository;

  Future<WorkContentDetail?> execute(String workContentDetailId) async {
    return await _workContentDetailRepository.getWorkContentDetailById(workContentDetailId);
  }
}