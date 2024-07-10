// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $rootRoute,
    ];

RouteBase get $rootRoute => ShellRouteData.$route(
      factory: $RootRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: '/sign-in',
          factory: $SignInRouteExtension._fromState,
        ),
        StatefulShellRouteData.$route(
          factory: $MainRouteExtension._fromState,
          branches: [
            StatefulShellBranchData.$branch(
              navigatorKey: HomeBranch.$navigatorKey,
              routes: [
                GoRouteData.$route(
                  path: '/home',
                  parentNavigatorKey: HomeRoute.$parentNavigatorKey,
                  factory: $HomeRouteExtension._fromState,
                ),
              ],
            ),
            StatefulShellBranchData.$branch(
              navigatorKey: ItemsBranch.$navigatorKey,
              routes: [
                GoRouteData.$route(
                  path: '/items',
                  parentNavigatorKey: ItemsRoute.$parentNavigatorKey,
                  factory: $ItemsRouteExtension._fromState,
                  routes: [
                    GoRouteData.$route(
                      path: ':item',
                      parentNavigatorKey: ItemRoute.$parentNavigatorKey,
                      factory: $ItemRouteExtension._fromState,
                    ),
                  ],
                ),
              ],
            ),
            StatefulShellBranchData.$branch(
              navigatorKey: SettingsBranch.$navigatorKey,
              routes: [
                GoRouteData.$route(
                  path: '/settings',
                  parentNavigatorKey: SettingsRoute.$parentNavigatorKey,
                  factory: $SettingsRouteExtension._fromState,
                ),
              ],
            ),
          ],
        ),
      ],
    );

extension $RootRouteExtension on RootRoute {
  static RootRoute _fromState(GoRouterState state) => RootRoute();
}

extension $SignInRouteExtension on SignInRoute {
  static SignInRoute _fromState(GoRouterState state) => SignInRoute();

  String get location => GoRouteData.$location(
        '/sign-in',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $MainRouteExtension on MainRoute {
  static MainRoute _fromState(GoRouterState state) => const MainRoute();
}

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  String get location => GoRouteData.$location(
        '/home',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ItemsRouteExtension on ItemsRoute {
  static ItemsRoute _fromState(GoRouterState state) => const ItemsRoute();

  String get location => GoRouteData.$location(
        '/items',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ItemRouteExtension on ItemRoute {
  static ItemRoute _fromState(GoRouterState state) => ItemRoute(
        item: state.pathParameters['item']!,
      );

  String get location => GoRouteData.$location(
        '/items/${Uri.encodeComponent(item)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SettingsRouteExtension on SettingsRoute {
  static SettingsRoute _fromState(GoRouterState state) => const SettingsRoute();

  String get location => GoRouteData.$location(
        '/settings',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
