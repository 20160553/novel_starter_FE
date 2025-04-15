import 'package:flutter/material.dart';
import 'package:novel_starter/models/work.dart';
import 'package:novel_starter/screens/novel_detail_screen.dart';

class WorkCard extends StatelessWidget {
  const WorkCard(this.work, {super.key});

  final Work work;

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
                              Text('등록된 회차: ${10}'),
                              Text('조회수: ${ 1000 + 500}'),
                              Text('추천수: ${ 50 + 20}'),
                              Text('선호작 수: ${work.favoriteCount}'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
  }
  
}