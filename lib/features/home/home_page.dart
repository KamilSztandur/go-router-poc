import 'package:flutter/material.dart';
import 'package:maat_router_poc/design_system/scaffold.dart';

class HomePage extends MaterialPage<void> {
  const HomePage() : super(child: const HomeScreen());
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaatScaffold(title: 'Home');
  }
}
