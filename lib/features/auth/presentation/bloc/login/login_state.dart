part of 'login_bloc.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState.initial({
    @Default(true) bool isPasswordObscured,
  }) = LoginInitial;

  const factory LoginState.loading({
    @Default(true) bool isPasswordObscured,
  }) = LoginLoading;

  const factory LoginState.success(
    LoginEntity result, {
    @Default(true) bool isPasswordObscured,
  }) = LoginSuccess;

  const factory LoginState.failure(
    String message, {
    @Default(true) bool isPasswordObscured,
  }) = LoginFailure;
}
