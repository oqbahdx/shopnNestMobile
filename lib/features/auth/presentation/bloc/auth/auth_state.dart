part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const AuthState._();

  const factory AuthState.initial() = AuthInitial;

  const factory AuthState.loading() = AuthLoading;

  const factory AuthState.authenticated() = Authenticated;

  const factory AuthState.unauthenticated() = Unauthenticated;

  bool get isAuthenticated => maybeWhen(
        authenticated: () => true,
        orElse: () => false,
      );

  bool get isUninitialized => maybeWhen(
        initial: () => true,
        orElse: () => false,
      );
}
