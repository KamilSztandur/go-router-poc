import 'package:flutter/widgets.dart';
import 'package:maat_router_poc/router/page_ids.dart';
import 'package:maat_router_poc/router/router.dart';
import 'package:provider/provider.dart';

abstract class AppPage extends Page<void> {
  const AppPage({
    required this.pageId,
    required this.builder,
    this.transparentBackground = false,
    this.withTransition = true,
  });

  final PageId pageId;
  final WidgetBuilder builder;
  final bool transparentBackground;
  final bool withTransition;

  @override
  Route<void> createRoute(BuildContext context) => AppRoute(
        id: pageId,
        settings: this,
        withTransition: withTransition,
        builder: (context) => Provider.value(
          value: pageId,
          child: builder(context),
        ),
      );
}

extension GetPageIdFromBuildContext on BuildContext {
  PageId get pageId => read<PageId>();
}
