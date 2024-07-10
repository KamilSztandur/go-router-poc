import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(Unauthenticated());

  Future<void> signIn() async => emit(LoggedIn());

  Future<void> signOut() async => emit(Unauthenticated());
}

sealed class AuthState {}

final class LoggedIn extends AuthState {}

final class Unauthenticated extends AuthState {}
