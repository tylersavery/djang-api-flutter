import 'package:dj_flutter_app/src/core/components/list.component.dart';
import 'package:dj_flutter_app/src/feature/post/components/post_list_tile.component.dart';
import 'package:dj_flutter_app/src/feature/post/models/post.model.dart';
import 'package:dj_flutter_app/src/feature/post/providers/post_list.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostListComponent extends ConsumerWidget {
  final String familyIdentifier;

  const PostListComponent({
    super.key,
    this.familyIdentifier = 'public',
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListComponent<Post>(
      state: ref.watch(postListProvider(familyIdentifier)),
      handleRefresh: ref.read(postListProvider(familyIdentifier).notifier).refresh,
      handleLoadMore: ref.read(postListProvider(familyIdentifier).notifier).loadNextPage,
      itemBuilder: (post) => PostListTileComponent(post: post),
    );
  }
}
