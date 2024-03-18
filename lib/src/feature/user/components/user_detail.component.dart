import 'package:dj_flutter_app/src/feature/user/models/user.model.dart';
import 'package:flutter/material.dart';

class UserDetailComponent extends StatelessWidget {
  final User user;
  const UserDetailComponent({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(user.bio),
    );
  }
}
