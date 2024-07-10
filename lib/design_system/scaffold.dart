import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MaatScaffold extends HookWidget {
  const MaatScaffold({
    super.key,
    required this.title,
    this.bodySlivers = const [],
  });

  final String title;
  final List<Widget> bodySlivers;

  @override
  Widget build(BuildContext context) {
    final safeArea = MediaQuery.paddingOf(context);

    final scrollController = useScrollController();

    // ignore: use_design_system_item_AppScaffold
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverAppBar.large(
            flexibleSpace: SafeArea(
              child: GestureDetector(
                onTap: () => scrollController.animateTo(
                  0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOutCubicEmphasized,
                ),
                behavior: HitTestBehavior.opaque,
                child: Center(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ),
              ),
            ),
          ),
          ...bodySlivers,
          SliverToBoxAdapter(
            child: SizedBox(height: safeArea.bottom),
          ),
        ],
      ),
    );
  }
}
