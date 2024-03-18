import 'package:dj_flutter_app/src/feature/comment/components/comment_form.component.dart';
import 'package:dj_flutter_app/src/feature/comment/components/comment_list.component.dart';
import 'package:dj_flutter_app/src/feature/post/models/post.model.dart';
import 'package:flutter/material.dart';

class PostDetailComponent extends StatelessWidget {
  final Post post;
  const PostDetailComponent({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post.body),
            Text("by ${post.owner.name}"),
            Divider(),
            Text("Comments:"),
            CommentListComponent(familyIdentifer: post.uuid),
            CommentFormComponent(post: post),
          ],
        ),
      ),
    );
  }
}
