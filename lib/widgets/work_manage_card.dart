
import 'package:flutter/material.dart';
import 'package:novel_starter/models/work.dart';
import 'package:novel_starter/screens/novel_detail_screen.dart';

class WorkManageCard extends StatelessWidget {
  const WorkManageCard(this.work, {super.key, this.onDeleteWork});

  final Work work;
  final void Function(Work work)? onDeleteWork;

  @override
  Widget build(BuildContext context) {
    return Card(
          margin: const EdgeInsets.only(bottom: 16.0),
          elevation: 4.0,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NovelDetailScreen(
                    work: work,
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
                        work.thumbnailImgUrl,
                        width: 80,
                        height: 120,
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              work.title,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text('등록된 회차: ${work.episodeCount}'),
                            Text('조회수: ${100}'),
                            Text('추천수: ${work.likeCount}'),
                            Text('선호작 수: ${work.favoriteCount}'),
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
                              if (onDeleteWork != null) {
                                onDeleteWork!(work);
                              }
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
  }
  
}