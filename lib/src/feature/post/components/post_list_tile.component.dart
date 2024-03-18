import 'package:dj_flutter_app/src/feature/post/models/post.model.dart';
import 'package:dj_flutter_app/src/feature/post/post.routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PostListTileComponent extends StatelessWidget {
  final Post post;

  const PostListTileComponent({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(post.title),
        subtitle: Text(
          post.owner.name,
        ),
        onTap: () {
          context.push("${PostRoutes.namespace}/${post.uuid}");
        },
      ),
    );
  }
}
