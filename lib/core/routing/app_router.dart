import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:k_info/features/home/home_screen.dart';
import 'package:k_info/features/news/news_detail_screen.dart';
import 'package:k_info/features/guide/guide_screen.dart';
import 'package:k_info/features/guide/visa/visa_info_screen.dart';
// import 'package:k_info/features/guide/topik/topik_info_screen.dart';
// import 'package:k_info/features/settings/settings_screen.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _shellNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (BuildContext context, GoRouterState state,
            StatefulNavigationShell navigationShell) {
          return ScaffoldWithBottomNav(
            navigationShell: navigationShell,
          );
        },
        branches: [
          // News Branch
          StatefulShellBranch(
            navigatorKey: _shellNavigatorKey,
            routes: [
              GoRoute(
                path: '/',
                name: 'home',
                builder: (BuildContext context, GoRouterState state) {
                  return const HomeScreen();
                },
                routes: [
                  GoRoute(
                    path: 'news/:id',
                    name: 'news-detail',
                    builder: (BuildContext context, GoRouterState state) {
                      final id = state.pathParameters['id'];
                      return NewsDetailScreen(newsId: id!);
                    },
                  ),
                ],
              ),
            ],
          ),
          // Guide Branch
          StatefulShellBranch(
            navigatorKey: GlobalKey<NavigatorState>(),
            routes: [
              GoRoute(
                path: '/guide',
                name: 'guide',
                builder: (BuildContext context, GoRouterState state) {
                  return const GuideScreen();
                },
                routes: [
                  GoRoute(
                    path: 'visa',
                    name: 'visa-info',
                    builder: (BuildContext context, GoRouterState state) {
                      return const VisaInfoScreen();
                    },
                  ),
                  GoRoute(
                    path: 'topik',
                    name: 'topik-info',
                    builder: (BuildContext context, GoRouterState state) {
                      return const Placeholder(
                        child: Text('TopikInfoScreen'),
                      );
                      // return const TopikInfoScreen();
                    },
                  ),
                ],
              ),
            ],
          ),
          // Settings Branch
          StatefulShellBranch(
            navigatorKey: GlobalKey<NavigatorState>(),
            routes: [
              GoRoute(
                path: '/settings',
                name: 'settings',
                builder: (BuildContext context, GoRouterState state) {
                  return const Placeholder(child: Text('SettingsScreen'));
                  // return const SettingsScreen();
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

class ScaffoldWithBottomNav extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const ScaffoldWithBottomNav({
    Key? key,
    required this.navigationShell,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        onTap: _onTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Guide',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  void _onTap(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
