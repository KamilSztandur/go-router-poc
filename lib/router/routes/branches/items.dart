part of '../routes.dart';

class ItemsBranch extends StatefulShellBranchData {
  const ItemsBranch();

  static final $navigatorKey = navigatorKeys.branches.years;
}

class ItemsRoute extends GoRouteData {
  const ItemsRoute();

  static final $parentNavigatorKey = ItemsBranch.$navigatorKey;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      ItemsPage();
}

class ItemRoute extends GoRouteData {
  const ItemRoute({
    required this.item,
  });

  final String item;

  static final $parentNavigatorKey = ItemsBranch.$navigatorKey;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      ItemPage(item: item);
}
