import 'package:dj_flutter_app/src/feature/post/screens/post_detail.screen.dart';
import 'package:dj_flutter_app/src/feature/post/screens/post_form.screen.dart';
import 'package:dj_flutter_app/src/feature/post/screens/post_list.screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PostRoutes {
  static const String namespace = "/posts";
  static final shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: "Post Shell");
  static StatefulShellBranch branch = StatefulShellBranch(
    navigatorKey: shellNavigatorKey,
    routes: [
      GoRoute(
        path: namespace,
        builder: (context, _) => PostListScreen(),
      ),
      GoRoute(
        path: "$namespace/edit",
        builder: (context, state) {
          return PostFormScreen();
        },
      ),
      GoRoute(
        path: "$namespace/:postUuid",
        builder: (context, state) {
          return PostDetailScreen(
            postUuid: state.pathParameters['postUuid']!,
          );
        },
      ),
    ],
  );
}
