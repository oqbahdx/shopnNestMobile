part of 'forgot_password_bloc.dart';

@freezed
abstract class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState.initial() = ForgotPasswordInitial;

  const factory ForgotPasswordState.loading() = ForgotPasswordLoading;

  const factory ForgotPasswordState.success(String message) = ForgotPasswordSuccess;

  const factory ForgotPasswordState.failure(String message) = ForgotPasswordFailure;
}
