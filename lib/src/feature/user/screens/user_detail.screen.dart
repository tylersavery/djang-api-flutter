import 'package:dj_flutter_app/src/core/screens/detail.screen.dart';
import 'package:dj_flutter_app/src/feature/user/components/user_detail.component.dart';
import 'package:dj_flutter_app/src/feature/user/models/user.model.dart';
import 'package:dj_flutter_app/src/feature/user/providers/user_detail.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserDetailScreen extends ConsumerWidget {
  final String userUuid;
  const UserDetailScreen({
    super.key,
    required this.userUuid,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(userDetailProvider(userUuid));

    return DetailScreen<User>(
      data: data,
      whenData: (user) => _UserDetailScreen(user),
    );
  }
}

class _UserDetailScreen extends StatelessWidget {
  final User user;
  const _UserDetailScreen(
    this.user, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: UserDetailComponent(user: user),
    );
  }
}
