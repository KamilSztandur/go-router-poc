import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maat_router_poc/features/auth/cubits/auth_cubit.dart';

class MaatGlobalProviders extends StatelessWidget {
  const MaatGlobalProviders({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: child,
    );
  }
}
