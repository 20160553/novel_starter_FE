import 'package:flutter/material.dart';
import 'package:novel_starter/models/work.dart';
import 'package:novel_starter/models/work_content.dart';
import 'package:novel_starter/screens/novel_reading_screen.dart';

class WorkContentListTile extends StatelessWidget {
  const WorkContentListTile({super.key, required this.work,  required this.workContent});

  final WorkContent workContent;
  final Work work;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(workContent.title),
      leading: workContent is Episode ? Icon(Icons.menu_book): Icon(Icons.announcement),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NovelReadingScreen(work: work, workContent: workContent),
          ),
        );
      },
    );
  }
}
