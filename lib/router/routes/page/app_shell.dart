import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class MaatShell extends StatelessWidget {
  const MaatShell({
    super.key,
    required this.routerState,
    required this.navigationShell,
  });

  final GoRouterState routerState;
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    final index = navigationShell.currentIndex;

    final destinations = [
      _Destination(
        icon: Icons.home_outlined,
        label: 'Home',
        index: 0,
        currentIndex: index,
      ),
      _Destination(
        icon: Icons.list_alt,
        label: 'Items',
        index: 1,
        currentIndex: index,
      ),
      _Destination(
        icon: Icons.settings_outlined,
        label: 'Settings',
        index: 2,
        currentIndex: index,
      ),
    ];

    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarContrastEnforced: false,
        statusBarColor: Colors.transparent,
        systemStatusBarContrastEnforced: false,
        statusBarBrightness: brightness,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      // ignore: use_design_system_item_MaatScaffold
      child: Scaffold(
        bottomNavigationBar: NavigationBar(
          destinations: destinations,
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: navigationShell.goBranch,
        ),
        body: navigationShell,
      ),
    );
  }
}

class _Destination extends NavigationDestination {
  _Destination({
    required IconData icon,
    required super.label,
    required int index,
    required int currentIndex,
  }) : super(
          icon: _DestinationIcon(
            icon: icon,
            index: index,
            currentIndex: currentIndex,
          ),
        );
}

class _DestinationIcon extends HookWidget {
  const _DestinationIcon({
    required this.icon,
    required this.index,
    required this.currentIndex,
  });

  final IconData icon;
  final int index;
  final int currentIndex;

  static const animationDuration = Duration(milliseconds: 500);
  static const animationCurve = Curves.easeInOutCubicEmphasized;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final selected = currentIndex == index;

    final animationController = useAnimationController(
      duration: animationDuration,
      initialValue: selected ? 1 : 0,
    );

    useValueChanged(
      selected,
      (_, __) => switch (selected) {
        true => animationController.forward(),
        false => animationController.reverse(),
      },
    );

    final animation = useAnimation(
      CurvedAnimation(
        parent: animationController,
        curve: animationCurve,
        reverseCurve: animationCurve.flipped,
      ),
    );

    final color = ColorTween(
      begin: colors.onSurface,
      end: selected ? colors.primary : colors.onSurface,
    ).transform(animation);

    final fill = animation;

    return Icon(
      icon,
      size: 24,
      color: color,
      fill: fill,
    );
  }
}
