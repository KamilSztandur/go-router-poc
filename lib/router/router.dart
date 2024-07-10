import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:maat_router_poc/features/auth/cubits/auth_cubit.dart';
import 'package:maat_router_poc/router/redirections.dart';
import 'package:maat_router_poc/router/routes/page/page_ids.dart';
import 'package:maat_router_poc/router/routes/routes.dart';
import 'package:provider/provider.dart';

final navigatorKeys = (
  root: GlobalKey<NavigatorState>(),
  branches: (
    home: GlobalKey<NavigatorState>(),
    years: GlobalKey<NavigatorState>(),
    settings: GlobalKey<NavigatorState>(),
  ),
);

class _AuthCubitNotifier extends ChangeNotifier {
  _AuthCubitNotifier(this._cubit) {
    _cubit.stream.listen((state) => notifyListeners());
  }

  final AuthCubit _cubit;

  AuthState get state => _cubit.state;
}

GoRouter createGoRouter(BuildContext context) {
  final authCubit = context.read<AuthCubit>();

  return GoRouter(
    navigatorKey: navigatorKeys.root,
    routes: $appRoutes,
    initialLocation: authCubit.state is LoggedIn
        ? const HomeRoute().location
        : const SignInRoute().location,
    redirect: (context, state) => getRedirection(
      context,
      state.uri.toString(),
      queryParams: state.uri.queryParameters,
    ),
    refreshListenable: _AuthCubitNotifier(authCubit),
  );
}

class AppRoute extends MaterialPageRoute<void> {
  AppRoute({
    required PageId id,
    required super.builder,
    required super.settings,
    required this.withTransition,
  }) : id = id.name;

  final String id;
  final bool withTransition;

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) =>
      withTransition
          ? super.buildTransitions(
              context,
              animation,
              secondaryAnimation,
              child,
            )
          : child;

  @override
  Duration get transitionDuration =>
      withTransition ? Duration.zero : super.transitionDuration;
}
