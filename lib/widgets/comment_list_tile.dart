import 'package:flutter/material.dart';

class CommentListTile extends StatelessWidget {
  const CommentListTile({super.key, required this.comment});

  final String comment;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('작성자 : $comment'),
        subtitle: Text('내용: ${comment}'),
      ),
    );
  }
}
