import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppGlobalProviders extends StatelessWidget {
  const AppGlobalProviders({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => ThemeData.light()), // TODO
      ],
      child: child,
    );
  }
}
