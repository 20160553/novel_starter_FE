import 'package:flutter/material.dart';
import 'package:novel_starter/models/work_content.dart';
import 'package:novel_starter/widgets/comment_list_view.dart';
import 'package:novel_starter/widgets/comment_writing_layout.dart';

class CommentLayout extends StatelessWidget {
  const CommentLayout(this._workContent, {super.key});

  final WorkContent _workContent;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CommentWritingLayout(_workContent),
            CommentListView(),
          ],
        ),
      ),
      );
  }
}
