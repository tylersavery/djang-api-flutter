import 'package:dj_flutter_app/src/feature/comment/models/comment.model.dart';
import 'package:flutter/material.dart';

class CommentListTileComponent extends StatelessWidget {
  final Comment comment;
  const CommentListTileComponent({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(comment.body),
      subtitle: Text(comment.owner.name),
    );
  }
}
