import 'package:flutter/material.dart';
import 'package:maat_router_poc/router/routes.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData.light(),
      routerConfig: router,
    );
  }
}
