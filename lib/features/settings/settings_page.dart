import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maat_router_poc/design_system/scaffold.dart';
import 'package:maat_router_poc/features/auth/cubits/auth_cubit.dart';
import 'package:maat_router_poc/router/routes/page/app_page.dart';
import 'package:maat_router_poc/router/routes/page/page_ids.dart';

class SettingsPage extends MaatPage {
  SettingsPage()
      : super(
          pageId: PageId.settings,
          builder: (context) => const SettingsScreen(),
        );
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaatScaffold(
      title: 'Settings',
      bodySlivers: [
        const SliverPadding(
          padding: EdgeInsets.all(16),
          sliver: SliverToBoxAdapter(
            child: Text('This is example setting spage'),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
              onPressed: context.read<AuthCubit>().signOut,
              child: const Text(
                'Sign out',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
