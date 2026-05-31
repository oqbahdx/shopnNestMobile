import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/register_entity.dart';
import '../../../domain/usecases/register_usecase.dart';

part 'register_bloc.freezed.dart';
part 'register_event.dart';
part 'register_state.dart';

@injectable
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUseCase registerUseCase;

  RegisterBloc(this.registerUseCase) : super(const RegisterState.initial()) {
    on<RegisterSubmitted>(_onRegisterSubmitted);
    on<PasswordChanged>(_onPasswordChanged);
    on<PasswordVisibilityToggled>(_onPasswordVisibilityToggled);
  }

  void _onPasswordChanged(
    PasswordChanged event,
    Emitter<RegisterState> emit,
  ) {
    final password = event.password;

    final hasMinLength = password.length >= 8;
    final hasUppercase = RegExp(r'[A-Z]').hasMatch(password);
    final hasLowercase = RegExp(r'[a-z]').hasMatch(password);
    final hasNumber = RegExp(r'[0-9]').hasMatch(password);
    final hasSpecialCharacter = RegExp(r'[^A-Za-z0-9]').hasMatch(password);
    final isPasswordStrong = hasMinLength &&
        hasUppercase &&
        hasLowercase &&
        hasNumber &&
        hasSpecialCharacter;

    emit(state.copyWith(
      hasMinLength: hasMinLength,
      hasUppercase: hasUppercase,
      hasLowercase: hasLowercase,
      hasNumber: hasNumber,
      hasSpecialCharacter: hasSpecialCharacter,
      isPasswordStrong: isPasswordStrong,
    ));
  }

  void _onPasswordVisibilityToggled(
    PasswordVisibilityToggled event,
    Emitter<RegisterState> emit,
  ) {
    emit(state.copyWith(isPasswordObscured: !state.isPasswordObscured));
  }

  Future<void> _onRegisterSubmitted(
    RegisterSubmitted event,
    Emitter<RegisterState> emit,
  ) async {
    emit(RegisterState.loading(
      hasMinLength: state.hasMinLength,
      hasUppercase: state.hasUppercase,
      hasLowercase: state.hasLowercase,
      hasNumber: state.hasNumber,
      hasSpecialCharacter: state.hasSpecialCharacter,
      isPasswordStrong: state.isPasswordStrong,
      isPasswordObscured: state.isPasswordObscured,
    ));

    final result = await registerUseCase(
      RegisterParams(
        firstName: event.firstName,
        lastName: event.lastName,
        email: event.email,
        password: event.password,
        confirmPassword: event.confirmPassword,
      ),
    );

    result.fold(
      (failure) => emit(RegisterState.failure(
        failure.message,
        hasMinLength: state.hasMinLength,
        hasUppercase: state.hasUppercase,
        hasLowercase: state.hasLowercase,
        hasNumber: state.hasNumber,
        hasSpecialCharacter: state.hasSpecialCharacter,
        isPasswordStrong: state.isPasswordStrong,
        isPasswordObscured: state.isPasswordObscured,
      )),
      (register) => emit(RegisterState.success(
        register,
        hasMinLength: state.hasMinLength,
        hasUppercase: state.hasUppercase,
        hasLowercase: state.hasLowercase,
        hasNumber: state.hasNumber,
        hasSpecialCharacter: state.hasSpecialCharacter,
        isPasswordStrong: state.isPasswordStrong,
        isPasswordObscured: state.isPasswordObscured,
      )),
    );
  }
}
