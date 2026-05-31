part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const AuthEvent._();

  const factory AuthEvent.authCheckRequested() = AuthCheckRequested;

  const factory AuthEvent.loggedOut() = AuthLoggedOut;
}
