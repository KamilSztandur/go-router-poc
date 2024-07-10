import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maat_router_poc/app.dart';
import 'package:maat_router_poc/global_providers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  runApp(
    const MaatGlobalProviders(
      child: MaatApp(),
    ),
  );
}
