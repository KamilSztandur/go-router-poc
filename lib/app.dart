import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:maat_router_poc/router/router.dart';

class MaatApp extends StatelessWidget {
  const MaatApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final router = useMemoized(
      () => createGoRouter(context),
    );

    return MaterialApp.router(
      routerConfig: router,
      theme: ThemeData.light(),
    );
  }
}
