import 'package:dj_flutter_app/src/core/screens/detail.screen.dart';
import 'package:dj_flutter_app/src/feature/auth/providers/auth.provider.dart';
import 'package:dj_flutter_app/src/feature/post/components/post_detail.component.dart';
import 'package:dj_flutter_app/src/feature/post/models/post.model.dart';
import 'package:dj_flutter_app/src/feature/post/post.routes.dart';
import 'package:dj_flutter_app/src/feature/post/providers/post_detail.provider.dart';
import 'package:dj_flutter_app/src/feature/post/providers/post_form.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PostDetailScreen extends ConsumerWidget {
  final String postUuid;
  const PostDetailScreen({
    super.key,
    required this.postUuid,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(postDetailProvider(postUuid));

    return DetailScreen<Post>(
      data: data,
      whenData: (post) => _PostDetailScreen(post),
    );
  }
}

class _PostDetailScreen extends ConsumerWidget {
  final Post post;
  const _PostDetailScreen(
    this.post, {
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
        actions: [
          if (post.owner.uuid == ref.watch(authProvider).user?.uuid)
            TextButton(
              onPressed: () {
                ref.read(postFormProvider.notifier).loadPost(post);
                context.push("${PostRoutes.namespace}/edit");
              },
              child: Text("Edit"),
            )
        ],
      ),
      body: PostDetailComponent(post: post),
    );
  }
}
