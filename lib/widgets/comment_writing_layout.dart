import 'package:flutter/material.dart';

class CommentWritingLayout extends StatelessWidget {
  const CommentWritingLayout({super.key});

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
                  minLines: 3,
                  maxLines: 8,
                  decoration: InputDecoration(
                    labelText: '댓글 작성',
                    border: OutlineInputBorder(),
                    alignLabelWithHint: true,
                  ),
                ),
              ),
              SizedBox(width: 4,),
              ElevatedButton(
                onPressed: () {
                  //todo
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
