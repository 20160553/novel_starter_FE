import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/models/work.dart';
import 'package:novel_starter/providers/viewmodels/work/manage_work_viewmodel_provider.dart';
import 'package:novel_starter/providers/viewmodels/user_viewmodel_provider.dart';
import 'package:novel_starter/screens/novel_detail_screen.dart';
import 'package:novel_starter/viewmodels/manage_work_viewmodel.dart';
import 'package:novel_starter/viewmodels/user_viewmodel.dart';

class NovelManageScreen extends ConsumerStatefulWidget {
  const NovelManageScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _NovelManageScreen();
  }
}

class _NovelManageScreen extends ConsumerState<NovelManageScreen> {
  late final ManageWorkViewModel _manageWorkViewModel;
  late final UserViewModel _userViewModel;
  @override
  void initState() {
    super.initState();
    _manageWorkViewModel = ref.read(manageWorkViewModelProvider.notifier);
    _userViewModel = ref.read(userViewModelProvider.notifier);

    String? currentUid = _userViewModel.currentUid;
    if (currentUid == null) {
      Navigator.pop(context);
    } else {
      WidgetsBinding.instance.addPostFrameCallback(
          (_) => _manageWorkViewModel.getWorksByUserId(currentUid));
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Work> works = ref.watch(manageWorkViewModelProvider).when(
        loading: () => [],
        success: (data) {
          return data ?? [];
        },
        error: (e) => []);

    return Scaffold(
      appBar: AppBar(
        title: Text('내 작품 관리'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: works.length, // 등록된 작품 수 (예시)
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 16.0),
            elevation: 4.0,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NovelDetailScreen(
                      work: works[index],
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          works[index].thumbnailImgUrl,
                          width: 80,
                          height: 120,
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                works[index].title,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text('등록된 회차: ${index + 10}'),
                              Text('조회수: ${index * 1000 + 500}'),
                              Text('추천수: ${index * 50 + 20}'),
                              Text('선호작 수: ${works[index].favoriteCount}'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // 회차 쓰기 로직
                              },
                              child: Text('회차 쓰기'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // 소설 관리 로직
                              },
                              child: Text('소설 관리'),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // 소설 통계 로직
                              },
                              child: Text('소설 통계'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // 소설 삭제 로직
                                _manageWorkViewModel.deleteWork(works[index]);
                              },
                              child: Text('소설 삭제'),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
