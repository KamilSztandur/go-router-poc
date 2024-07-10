import 'package:flutter/material.dart';
import 'package:maat_router_poc/features/auth/cubits/auth_cubit.dart';
import 'package:maat_router_poc/router/routes/routes.dart';
import 'package:provider/provider.dart';

typedef Redirection = String? Function(
  BuildContext context,
  String location, {
  Map<String, String>? queryParams,
});

String? getRedirection(
  BuildContext context,
  String location, {
  Map<String, String>? queryParams,
}) {
  final redirections = [
    authStateRedirect,
  ];

  for (final redirection in redirections) {
    final newLocation = redirection(
      context,
      location,
      queryParams: queryParams,
    );

    if (newLocation != null && newLocation != location) {
      return newLocation;
    }
  }

  return null;
}

final _unauthenticatedRoutes = [
  const SignInRoute().location,
];

String? authStateRedirect(
  BuildContext context,
  String location, {
  Map<String, String>? queryParams,
}) {
  final locationWithoutQueryParams = location.split('?').first;
  final isUnauthenticatedRoute = _unauthenticatedRoutes.contains(
    locationWithoutQueryParams,
  );

  final authCubit = context.read<AuthCubit>();
  final authState = authCubit.state;
  final isAuthenticated = authState is LoggedIn;

  if (isAuthenticated && isUnauthenticatedRoute) {
    return const HomeRoute().location;
  }

  if (!isAuthenticated && !isUnauthenticatedRoute) {
    return const SignInRoute().location;
  }

  return null;
}
