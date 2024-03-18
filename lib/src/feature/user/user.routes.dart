import 'package:dj_flutter_app/src/feature/user/screens/user_detail.screen.dart';
import 'package:dj_flutter_app/src/feature/user/screens/user_list.screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserRoutes {
  static const String namespace = "/users";
  static final shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: "User Shell");
  static StatefulShellBranch branch = StatefulShellBranch(
    navigatorKey: shellNavigatorKey,
    routes: [
      GoRoute(path: namespace, builder: (context, _) => UserListScreen()),
      GoRoute(
        path: "$namespace/:userUuid",
        builder: (context, state) {
          return UserDetailScreen(
            userUuid: state.pathParameters['userUuid']!,
          );
        },
      ),
    ],
  );
}
