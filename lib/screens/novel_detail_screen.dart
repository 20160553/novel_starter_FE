import 'package:flutter/material.dart';
import 'package:novel_starter/models/work.dart';
import 'package:novel_starter/widgets/work_detail_body.dart';
import 'package:novel_starter/widgets/work_info_card.dart';

class NovelDetailScreen extends StatelessWidget {
  final Work work;
  const NovelDetailScreen({
    super.key,
    required this.work,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('소설 정보'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WorkInfoCard(
              work: work,
            ),
            WorkDetailBody(work: work),
          ],
        ),
      ),
    );
  }
}
