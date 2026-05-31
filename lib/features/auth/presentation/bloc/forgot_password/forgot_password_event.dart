part of 'forgot_password_bloc.dart';

@freezed
sealed class ForgotPasswordEvent with _$ForgotPasswordEvent {
  const ForgotPasswordEvent._();

  const factory ForgotPasswordEvent.submitted({required String email}) = ForgotPasswordSubmitted;
}
