import 'package:dj_flutter_app/src/core/components/list.component.dart';
import 'package:dj_flutter_app/src/feature/post/providers/post_list.provider.dart';
import 'package:dj_flutter_app/src/feature/user/components/user_list_tile.component.dart';
import 'package:dj_flutter_app/src/feature/user/models/user.model.dart';
import 'package:dj_flutter_app/src/feature/user/providers/user_list.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserListComponent extends ConsumerWidget {
  final String familyIdentifier;

  const UserListComponent({
    super.key,
    this.familyIdentifier = 'public',
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListComponent<User>(
      state: ref.watch(userListProvider(familyIdentifier)),
      handleRefresh: ref.read(postListProvider(familyIdentifier).notifier).refresh,
      handleLoadMore: ref.read(postListProvider(familyIdentifier).notifier).loadNextPage,
      itemBuilder: (user) => UserListTileComponent(user: user),
    );
  }
}
