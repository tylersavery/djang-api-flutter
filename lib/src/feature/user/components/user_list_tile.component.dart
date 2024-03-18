import 'package:dj_flutter_app/src/feature/user/models/user.model.dart';
import 'package:dj_flutter_app/src/feature/user/user.routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserListTileComponent extends StatelessWidget {
  final User user;
  const UserListTileComponent({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(user.name),
        subtitle: Text(
          user.bio,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        onTap: () {
          context.push("${UserRoutes.namespace}/${user.uuid}");
        },
      ),
    );
  }
}
