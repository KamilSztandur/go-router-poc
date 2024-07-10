import 'package:flutter/material.dart';
import 'package:maat_router_poc/design_system/scaffold.dart';
import 'package:maat_router_poc/router/app_page.dart';
import 'package:maat_router_poc/router/page_ids.dart';
import 'package:maat_router_poc/router/routes.dart';

class HomePage extends AppPage {
  HomePage()
      : super(
          pageId: PageId.signIn,
          builder: (context) => const HomeScreen(),
        );
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaatScaffold(
      title: 'Home',
      bodySlivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
              onPressed: () => const SignInRoute().go(context),
              child: const Text(
                'Try to access sign in page',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
