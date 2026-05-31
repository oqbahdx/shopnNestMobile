part of 'register_bloc.dart';

@freezed
abstract class RegisterState with _$RegisterState {
  const factory RegisterState.initial({
    @Default(false) bool hasMinLength,
    @Default(false) bool hasUppercase,
    @Default(false) bool hasLowercase,
    @Default(false) bool hasNumber,
    @Default(false) bool hasSpecialCharacter,
    @Default(false) bool isPasswordStrong,
    @Default(true) bool isPasswordObscured,
  }) = RegisterInitial;

  const factory RegisterState.loading({
    @Default(false) bool hasMinLength,
    @Default(false) bool hasUppercase,
    @Default(false) bool hasLowercase,
    @Default(false) bool hasNumber,
    @Default(false) bool hasSpecialCharacter,
    @Default(false) bool isPasswordStrong,
    @Default(true) bool isPasswordObscured,
  }) = RegisterLoading;

  const factory RegisterState.success(
    RegisterEntity result, {
    @Default(false) bool hasMinLength,
    @Default(false) bool hasUppercase,
    @Default(false) bool hasLowercase,
    @Default(false) bool hasNumber,
    @Default(false) bool hasSpecialCharacter,
    @Default(false) bool isPasswordStrong,
    @Default(true) bool isPasswordObscured,
  }) = RegisterSuccess;

  const factory RegisterState.failure(
    String message, {
    @Default(false) bool hasMinLength,
    @Default(false) bool hasUppercase,
    @Default(false) bool hasLowercase,
    @Default(false) bool hasNumber,
    @Default(false) bool hasSpecialCharacter,
    @Default(false) bool isPasswordStrong,
    @Default(true) bool isPasswordObscured,
  }) = RegisterFailure;
}
