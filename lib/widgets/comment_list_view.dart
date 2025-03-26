import 'package:flutter/material.dart';
import 'package:novel_starter/models/comment.dart';
import 'package:novel_starter/widgets/comment_list_tile.dart';

class CommentListView extends StatelessWidget {
  const CommentListView(this._comments, {super.key});

  final List<Comment> _comments;

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: _comments.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return CommentListTile(
                comment: _comments[index],
              );
            },
          ),
        )
      ],
    ));
  }
}
