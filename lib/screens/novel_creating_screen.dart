import 'package:flutter/material.dart';

class NovelCreatingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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

              // 소설 제목
              TextField(
                decoration: InputDecoration(
                  labelText: '소설 제목',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),

              // 작품명
              TextField(
                decoration: InputDecoration(
                  labelText: '작품명',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),

              // 분류
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: '분류',
                  border: OutlineInputBorder(),
                ),
                items: ['분류 1', '분류 2', '분류 3']
                    .map((category) => DropdownMenuItem(
                          value: category,
                          child: Text(category),
                        ))
                    .toList(),
                onChanged: (value) {
                  // 분류 선택 로직
                },
              ),
              SizedBox(height: 16),

              // 연령
              TextField(
                decoration: InputDecoration(
                  labelText: '연령',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),

              // 1차 분류 태그
              TextField(
                decoration: InputDecoration(
                  labelText: '1차 분류 태그',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),

              // 해시태그
              TextField(
                decoration: InputDecoration(
                  labelText: '해시태그',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),

              // 연재 요일
              TextField(
                decoration: InputDecoration(
                  labelText: '연재 요일',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),

              // 작품 소개
              TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: '작품 소개',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),

              // 제출 버튼
              ElevatedButton(
                onPressed: () {
                  // 제출 로직
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
