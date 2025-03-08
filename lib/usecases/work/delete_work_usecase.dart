import 'package:novel_starter/models/work.dart';
import 'package:novel_starter/repositories/work_repository.dart';

class DeleteWorkUsecase {
  DeleteWorkUsecase(this._workRepository);
  final WorkRepository _workRepository;

  Future<void> execute(Work work) async {
    return _workRepository.deleteWork(work);
  }
}