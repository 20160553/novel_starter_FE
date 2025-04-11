import 'package:novel_starter/models/work.dart';
import 'package:novel_starter/repositories/work_repository.dart';

class GetWorkUsecase {
  GetWorkUsecase(this._workRepository);
  
  final WorkRepository _workRepository;

  Future<List<Work>> getWorksByUserUid(String userId) async {
    return _workRepository.getWorksByUserId(userId);
  }

  Future<Work?> getWorkByWorkId(String workId) async {
    return _workRepository.getWorkByWorkId(workId);
  }

  Future<List<Work>> getWorksSortedByTimeUsingWork(Work? last) async {
    return _workRepository.getWorksSortedByTimeUsingWork(last);
  }
}