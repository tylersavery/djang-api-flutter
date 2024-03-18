import 'package:dj_flutter_app/src/feature/auth/providers/auth.provider.dart';
import 'package:dj_flutter_app/src/feature/post/components/post_list.component.dart';
import 'package:dj_flutter_app/src/feature/post/post.routes.dart';
import 'package:dj_flutter_app/src/feature/post/providers/post_form.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PostListScreen extends ConsumerWidget {
  const PostListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
        actions: [
          TextButton(
            onPressed: () {
              ref.read(authProvider.notifier).logout();
            },
            child: Text("Logout"),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(postFormProvider.notifier).clear();
          context.push("${PostRoutes.namespace}/edit");
        },
        child: Icon(Icons.add),
      ),
      body: PostListComponent(),
    );
  }
}
