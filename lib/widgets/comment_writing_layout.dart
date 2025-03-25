import 'package:flutter/material.dart';

class CommentWritingLayout extends StatelessWidget {
  CommentWritingLayout(this._onCommentWriteButtonClicked, {super.key});

  final void Function(String comment) _onCommentWriteButtonClicked;

  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: TextField(
                  controller: _commentController,
                  minLines: 3,
                  maxLines: 8,
                  decoration: InputDecoration(
                    labelText: '댓글 작성',
                    border: OutlineInputBorder(),
                    alignLabelWithHint: true,
                  ),
                ),
              ),
              SizedBox(
                width: 4,
              ),
              ElevatedButton(
                onPressed: () {
                  _onCommentWriteButtonClicked(_commentController.text);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Icon(Icons.edit),
              ),
            ],
          ),
        )
      ],
    );
  }
}
