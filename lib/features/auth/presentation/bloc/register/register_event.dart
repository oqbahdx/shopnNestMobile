part of 'register_bloc.dart';

@freezed
class RegisterEvent with _$RegisterEvent {
  const RegisterEvent._();

  const factory RegisterEvent.submitted({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
  }) = RegisterSubmitted;

  const factory RegisterEvent.passwordChanged(String password) = PasswordChanged;

  const factory RegisterEvent.passwordVisibilityToggled() = PasswordVisibilityToggled;
}
