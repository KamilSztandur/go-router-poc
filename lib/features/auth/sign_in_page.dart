import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maat_router_poc/design_system/scaffold.dart';
import 'package:maat_router_poc/features/auth/cubits/auth_cubit.dart';
import 'package:maat_router_poc/router/routes/page/app_page.dart';
import 'package:maat_router_poc/router/routes/page/page_ids.dart';
import 'package:maat_router_poc/router/routes/routes.dart';

class SignInPage extends MaatPage {
  SignInPage()
      : super(
          pageId: PageId.signIn,
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
      title: 'Sign in',
      bodySlivers: [
        const SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverToBoxAdapter(
            child: Text(
              'Tap the button below to sign in',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
              onPressed: context.read<AuthCubit>().signIn,
              child: const Text('Sign in'),
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
              onPressed: () => const HomeRoute().go(context),
              child: const Text(
                'Try to access home page',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
