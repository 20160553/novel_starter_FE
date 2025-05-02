import 'package:flutter_test/flutter_test.dart';
import 'package:novel_starter/constants/integer.dart';
import 'package:novel_starter/models/api_state.dart';
import 'package:novel_starter/models/work.dart';
import 'package:novel_starter/usecases/work/get_work_usecase.dart';
import 'package:mocktail/mocktail.dart';
import 'package:novel_starter/viewmodels/get_works_viewmodel.dart';

class MockGetWorksUsecase extends Mock implements GetWorkUsecase {}

void main() {
  group('작품 목록 불러오기 테스트트', () {
    final Work mockWork = Work(
        title: "0",
        description: "0",
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        workId: "1",
        userId: "1");

    late MockGetWorksUsecase mockGetWorksUsecase;
    late GetWorksViewModel mockGetWorksViewModel;

    setUp(
      () {
        mockGetWorksUsecase = MockGetWorksUsecase();
        mockGetWorksViewModel = GetWorksViewModel(mockGetWorksUsecase);
      },
    );

    test('최초 작품 리스트 불러오기 - 성공', () async {
      final List<Work> mockData = [];

      for (int i = 0; i < LIST_CALL_SIZE; i++) {
        mockData.add(mockWork.copyWith(title: "$i"));
      }

      when(() => mockGetWorksUsecase.getWorksSortedByTimeUsingWork(null))
          .thenAnswer((_) async => mockData);

      expect(
        mockGetWorksViewModel.state,
        isA<SuccessState<List<Work>?>>(),
      );

      expectLater(
        mockGetWorksViewModel.stream,
        emitsInOrder([
          isA<LoadingState<List<Work>?>>(),
          isA<SuccessState<List<Work>?>>(),
        ]),
      );

      await mockGetWorksViewModel.getWorksSortedByTime(false);
    });

    test('최초 작품 리스트 불러오기 - 성공 = 빈리스트', () async {
      when(() => mockGetWorksUsecase.getWorksSortedByTimeUsingWork(null))
          .thenAnswer((_) async => []);

      expect(
        mockGetWorksViewModel.state,
        isA<SuccessState<List<Work>?>>(),
      );

      expectLater(
        mockGetWorksViewModel.stream,
        emitsInOrder([
          isA<LoadingState<List<Work>?>>(),
          isA<SuccessState<List<Work>?>>(),
        ]),
      );

      await mockGetWorksViewModel.getWorksSortedByTime(false);
    });

    test('최초 작품 리스트 불러오기 - 실패', () async {
      when(() => mockGetWorksUsecase.getWorksSortedByTimeUsingWork(null))
          .thenThrow((_) async => Exception('exception'));

      expect(
        mockGetWorksViewModel.state,
        isA<SuccessState<List<Work>?>>(),
      );

      expectLater(
        mockGetWorksViewModel.stream,
        emitsInOrder([
          isA<LoadingState<List<Work>?>>(),
          isA<ErrorState<List<Work>?>>(),
        ]),
      );

      await mockGetWorksViewModel.getWorksSortedByTime(false);
    });
  });
}
