import 'package:dj_flutter_app/src/core/components/list.component.dart';
import 'package:dj_flutter_app/src/feature/comment/components/comment_list_tile.component.dart';
import 'package:dj_flutter_app/src/feature/comment/models/comment.model.dart';
import 'package:dj_flutter_app/src/feature/comment/providers/comment_list.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommentListComponent extends ConsumerWidget {
  final String familyIdentifer;
  const CommentListComponent({super.key, required this.familyIdentifer});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListComponent<Comment>(
      state: ref.watch(commentListProvider(familyIdentifer)),
      handleRefresh: ref.read(commentListProvider(familyIdentifer).notifier).refresh,
      handleLoadMore: ref.read(commentListProvider(familyIdentifer).notifier).loadNextPage,
      itemBuilder: (comment) => CommentListTileComponent(comment: comment),
      shrinkWrap: true,
    );
  }
}
