import 'package:flutter/material.dart';

class NovelWritingScreen extends StatelessWidget {
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
