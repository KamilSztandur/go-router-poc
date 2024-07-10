import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maat_router_poc/features/home/home_page.dart';
import 'package:maat_router_poc/features/items/item_page.dart';
import 'package:maat_router_poc/features/items/items_page.dart';
import 'package:maat_router_poc/features/settings/settings_page.dart';
import 'package:maat_router_poc/router/app_shell.dart';

part 'branches/home.dart';
part 'branches/items.dart';
part 'branches/settings.dart';
part 'routes.g.dart';

final navigatorKeys = (
  root: GlobalKey<NavigatorState>(),
  branches: (
    home: GlobalKey<NavigatorState>(),
    years: GlobalKey<NavigatorState>(),
    settings: GlobalKey<NavigatorState>(),
  ),
);

final router = GoRouter(
  navigatorKey: navigatorKeys.root,
  routes: $appRoutes,
  initialLocation: const ItemsRoute().location,
);

@TypedStatefulShellRoute<MainRoute>(
  branches: [
    TypedStatefulShellBranch<HomeBranch>(
      routes: [
        TypedGoRoute<HomeRoute>(path: '/home'),
      ],
    ),
    TypedStatefulShellBranch<ItemsBranch>(
      routes: [
        TypedGoRoute<ItemsRoute>(
          path: '/items',
          routes: [
            TypedGoRoute<ItemRoute>(path: ':item'),
          ],
        ),
      ],
    ),
    TypedStatefulShellBranch<SettingsBranch>(
      routes: [
        TypedGoRoute<SettingsRoute>(path: '/settings'),
      ],
    ),
  ],
)
class MainRoute extends StatefulShellRouteData {
  const MainRoute();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return AppShell(
      routerState: state,
      navigationShell: navigationShell,
    );
  }
}
