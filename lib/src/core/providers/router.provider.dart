import 'package:dj_flutter_app/src/core/components/app_container.component.dart';
import 'package:dj_flutter_app/src/feature/auth/providers/auth.provider.dart';
import 'package:dj_flutter_app/src/feature/auth/screens/login.screen.dart';
import 'package:dj_flutter_app/src/feature/post/post.routes.dart';
import 'package:dj_flutter_app/src/feature/user/user.routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.provider.g.dart';

const homeRoute = PostRoutes.namespace;

final navigatorKey = GlobalKey<NavigatorState>();
Uri? initUrl = kIsWeb ? Uri.base : Uri.parse(homeRoute);

@riverpod
GoRouter router(RouterRef ref) {
  final authState = ref.watch(authProvider);
  return GoRouter(
    initialLocation: initUrl?.path ?? homeRoute,
    navigatorKey: navigatorKey,
    observers: [],
    redirect: (context, state) async {
      if (!authState.ready) {
        return '/loading';
      }

      String? path = initUrl?.path;

      final token = authState.token;

      //TODO: check if expired

      // not logged in
      if (token == null && path != "/login") {
        return '/login';
      }

      // logged in but on login screen
      if (path == '/login') {
        return homeRoute;
      }

      initUrl = null;
      return path;
    },
    routes: <RouteBase>[
      GoRoute(
        path: '/loading',
        builder: (context, state) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        },
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) {
          return const LoginScreen();
        },
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return AppContainerComponent(navigationShell: navigationShell);
        },
        branches: [
          PostRoutes.branch,
          UserRoutes.branch,
        ],
      )
    ],
  );
}
