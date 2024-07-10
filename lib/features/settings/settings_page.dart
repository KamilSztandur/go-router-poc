import 'package:flutter/material.dart';
import 'package:maat_router_poc/design_system/scaffold.dart';

class SettingsPage extends MaterialPage<void> {
  const SettingsPage() : super(child: const SettingsScreen());
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const MaatScaffold(
      title: 'Settings',
      bodySlivers: [
        SliverPadding(
          padding: EdgeInsets.all(16),
          sliver: SliverToBoxAdapter(
            child: Text('This is example setting spage'),
          ),
        ),
      ],
    );
  }
}
