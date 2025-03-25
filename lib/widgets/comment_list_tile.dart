import 'package:flutter/material.dart';
import 'package:novel_starter/models/comment.dart';

class CommentListTile extends StatelessWidget {
  const CommentListTile({super.key, required Comment comment}) : _comment = comment;

  final Comment _comment;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('작성자 : ${_comment.userId}'),
        subtitle: Text('내용: ${_comment.comment}'),
      ),
    );
  }
}
