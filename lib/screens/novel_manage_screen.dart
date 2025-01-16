import 'package:flutter/material.dart';

class NovelManageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('내 작품 관리'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: 5, // 등록된 작품 수 (예시)
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 16.0),
            elevation: 4.0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 80,
                        height: 120,
                        color: Colors.grey[300],
                        child: Center(
                          child: Text('북커버 이미지'),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '작품 제목 ${index + 1}',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text('등록된 회차: ${index + 10}'),
                            Text('조회수: ${index * 1000 + 500}'),
                            Text('추천수: ${index * 50 + 20}'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
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
                      ElevatedButton(
                        onPressed: () {
                          // 소설 통계 로직
                        },
                        child: Text('소설 통계'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
