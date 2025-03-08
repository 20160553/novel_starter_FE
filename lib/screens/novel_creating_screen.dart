import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/models/work.dart';
import 'package:novel_starter/providers/viewmodels/create_work_viewmodel_provider.dart';
import 'package:novel_starter/providers/viewmodels/user_viewmodel_provider.dart';
import 'package:novel_starter/utils/utils.dart';
import 'package:novel_starter/viewmodels/create_work_viewmodel.dart';
import 'package:novel_starter/viewmodels/user_viewmodel.dart';

class NovelCreatingScreen extends ConsumerStatefulWidget {
  const NovelCreatingScreen({super.key});
  
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _NovelCreatingScreen();
  }

}

class _NovelCreatingScreen extends ConsumerState<NovelCreatingScreen> {

  late final UserViewModel _userViewModel;
  late final CreateWorkViewModel _createWorkViewModel;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    _userViewModel = ref.read(userViewModelProvider.notifier);
    _createWorkViewModel = ref.read(createWorkViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text('새 작품 등록'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 소설 북커버 이미지
              GestureDetector(
                onTap: () {
                  // 북커버 이미지 선택 로직 추가
                },
                child: Container(
                  height: 200,
                  color: Colors.grey[300],
                  child: Center(
                    child: Text('소설 북커버 이미지 선택'),
                  ),
                ),
              ),
              SizedBox(height: 16),

              // 작품명
              TextField(
                decoration: InputDecoration(
                  labelText: '작품명',
                  border: OutlineInputBorder(),
                ),
                controller: _titleController,
              ),
              SizedBox(height: 16),

              // // 분류
              // DropdownButtonFormField<String>(
              //   decoration: InputDecoration(
              //     labelText: '분류',
              //     border: OutlineInputBorder(),
              //   ),
              //   items: ['분류 1', '분류 2', '분류 3']
              //       .map((category) => DropdownMenuItem(
              //             value: category,
              //             child: Text(category),
              //           ))
              //       .toList(),
              //   onChanged: (value) {
              //     // 분류 선택 로직
              //   },
              // ),
              // SizedBox(height: 16),

              // // 연령
              // TextField(
              //   decoration: InputDecoration(
              //     labelText: '연령',
              //     border: OutlineInputBorder(),
              //   ),
              // ),
              // SizedBox(height: 16),

              // // 1차 분류 태그
              // TextField(
              //   decoration: InputDecoration(
              //     labelText: '1차 분류 태그',
              //     border: OutlineInputBorder(),
              //   ),
              // ),
              // SizedBox(height: 16),

              // // 해시태그
              // TextField(
              //   decoration: InputDecoration(
              //     labelText: '해시태그',
              //     border: OutlineInputBorder(),
              //   ),
              // ),
              // SizedBox(height: 16),

              // // 연재 요일
              // TextField(
              //   decoration: InputDecoration(
              //     labelText: '연재 요일',
              //     border: OutlineInputBorder(),
              //   ),
              // ),
              // SizedBox(height: 16),

              // 작품 소개
              TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: '작품 소개',
                  border: OutlineInputBorder(),
                ),
                controller: _descriptionController,
              ),
              SizedBox(height: 16),

              // 제출 버튼
              ElevatedButton(
                onPressed: () {
                  // 제출 로직
                  if (_userViewModel.currentUid == "null") return;
                  final time = DateTime.now();
                  _createWorkViewModel.createWork(Work(
                    title: _titleController.text,
                    description: _descriptionController.text,
                    workId: uuid.v4(),
                    userId: _userViewModel.currentUid,
                    createdAt: time,
                    updatedAt: time,
                  ));
                },
                child: Text('작품 등록'),
              ),
            ],
          ),
        ),
      ),
    );
  }

}