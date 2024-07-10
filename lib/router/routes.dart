import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maat_router_poc/features/auth/sign_in_page.dart';
import 'package:maat_router_poc/features/home/home_page.dart';
import 'package:maat_router_poc/features/items/item_page.dart';
import 'package:maat_router_poc/features/items/items_page.dart';
import 'package:maat_router_poc/features/settings/settings_page.dart';
import 'package:maat_router_poc/router/app_shell.dart';
import 'package:maat_router_poc/router/router.dart';

part 'branches/home.dart';
part 'branches/items.dart';
part 'branches/settings.dart';
part 'routes.g.dart';

@TypedShellRoute<RootRoute>(
  routes: [
    TypedGoRoute<SignInRoute>(path: '/sign-in'),
    TypedStatefulShellRoute<MainRoute>(
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
    ),
  ],
)
class RootRoute extends ShellRouteData {
  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    // TODO: Here you put widgets like AppInteractionBlocker
    return navigator;
  }
}

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

class SignInRoute extends GoRouteData {
  const SignInRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      SignInPage();
}
