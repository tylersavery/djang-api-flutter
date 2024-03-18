import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AppContainerComponent extends ConsumerWidget {
  final StatefulNavigationShell navigationShell;

  const AppContainerComponent({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) {
          navigationShell.goBranch(index, initialLocation: index == navigationShell.currentIndex);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: "Posts",
            selectedIcon: Icon(
              Icons.home,
            ),
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: "Users",
            selectedIcon: Icon(
              Icons.person,
            ),
          ),
        ],
      ),
    );
  }
}
