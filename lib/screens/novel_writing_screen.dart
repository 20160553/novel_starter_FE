import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/providers/viewmodels/create_work_viewmodel_provider.dart';
import 'package:novel_starter/viewmodels/create_work_viewmodel.dart';

class NovelWritingScreen extends ConsumerStatefulWidget {
  const NovelWritingScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _NovelWritingScreen();
  }
  
}

class _NovelWritingScreen extends ConsumerState<NovelWritingScreen> {

  late final CreateWorkViewModel _createWorkViewModel;

  @override
  void initState() {
    super.initState();
    _createWorkViewModel = ref.read(createWorkViewModelProvider.notifier);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('소설 작성'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 작품 선택
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: '작품 선택',
                  border: OutlineInputBorder(),
                ),
                items: ['작품 1', '작품 2', '작품 3']
                    .map((work) => DropdownMenuItem(
                          value: work,
                          child: Text(work),
                        ))
                    .toList(),
                onChanged: (value) {
                  // 작품 선택 로직
                },
              ),
              SizedBox(height: 16),

              // 회차 제목
              TextField(
                decoration: InputDecoration(
                  labelText: '회차 제목',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),

              // 공지로 등록 여부
              Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (bool? value) {
                      // 공지 여부 로직
                    },
                  ),
                  Text('공지로 등록')
                ],
              ),
              SizedBox(height: 16),

              // 글 작성
              TextField(
                maxLines: 10,
                decoration: InputDecoration(
                  labelText: '글 작성',
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                ),
              ),
              SizedBox(height: 16),

              // 작가 코멘트 작성
              TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: '작가 코멘트',
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                ),
              ),
              SizedBox(height: 16),

              // 제출 버튼
              ElevatedButton(
                onPressed: () {
                  // 제출 로직
                },
                child: Text('작성 완료'),
              ),
            ],
          ),
        ),
      ),
    );
  
  }

}
