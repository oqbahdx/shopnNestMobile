import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/services/toast/toast_service.dart';
import '../../../../injection.dart';
import '../bloc/login/login_bloc.dart';
import 'auth_text_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  String? _requiredValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  String? _emailValidator(String? value) {
    final requiredError = _requiredValidator(value);
    if (requiredError != null) return requiredError;

    final isValid = RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(value!.trim());
    if (!isValid) return 'Enter a valid email address';
    return null;
  }

  Future<void> _onSubmit() async {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) {
      final toast = getIt<ToastService>();

      final emailError = _emailValidator(_emailController.text);
      if (emailError != null) {
        await toast.showError(emailError);
        return;
      }

      final passwordError = _requiredValidator(_passwordController.text);
      if (passwordError != null) {
        await toast.showError('Password is required');
        return;
      }

      await toast.showError('Please fix the highlighted fields');
      return;
    }

    context.read<LoginBloc>().add(
          LoginEvent.submitted(
            email: _emailController.text.trim(),
            password: _passwordController.text,
          ),
        );
  }

  void _resetForm(LoginState state) {
    _formKey.currentState?.reset();
    _emailController.clear();
    _passwordController.clear();
    if (!state.isPasswordObscured) {
      context
          .read<LoginBloc>()
          .add(const LoginEvent.passwordVisibilityToggled());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) async {
        await state.when(
          initial: (_) async {},
          loading: (_) async {},
          success: (result, _) async {
            await getIt<ToastService>().showSuccess(result.message);
            _resetForm(state);
            if (context.mounted) context.go('/home');
          },
          failure: (message, _) async {
            await getIt<ToastService>().showError(message);
          },
        );
      },
      child: BlocSelector<LoginBloc, LoginState, bool>(
        selector: (state) => state.maybeWhen(
          loading: (_) => true,
          orElse: () => false,
        ),
        builder: (context, isLoading) => AbsorbPointer(
          absorbing: isLoading,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _FieldCard(
                  children: [
                    AuthTextField(
                      controller: _emailController,
                      focusNode: _emailFocus,
                      label: 'Email address',
                      keyboardType: TextInputType.emailAddress,
                      validator: _emailValidator,
                      prefixIcon: Icons.email_outlined,
                      textInputAction: TextInputAction.next,
                      autofillHints: const [AutofillHints.email],
                      onFieldSubmitted: (_) => _passwordFocus.requestFocus(),
                    ),
                    _FieldDivider(),
                    BlocSelector<LoginBloc, LoginState, bool>(
                      selector: (state) => state.isPasswordObscured,
                      builder: (context, isObscured) => AuthTextField(
                        controller: _passwordController,
                        focusNode: _passwordFocus,
                        label: 'Password',
                        obscureText: isObscured,
                        validator: _requiredValidator,
                        prefixIcon: Icons.lock_outline_rounded,
                        textInputAction: TextInputAction.done,
                        autofillHints: const [AutofillHints.password],
                        onFieldSubmitted: (_) => _onSubmit(),
                        suffixIcon: _PasswordToggleButton(
                          isObscured: isObscured,
                          onToggle: () => context
                              .read<LoginBloc>()
                              .add(
                                const LoginEvent
                                    .passwordVisibilityToggled(),
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppTheme.spaceSm),
                _ForgotPasswordLink(),
                const SizedBox(height: AppTheme.space2xl),
                _LoginButton(isLoading: isLoading, onPressed: _onSubmit),
                const SizedBox(height: AppTheme.spaceXl),
                _SignUpLink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FieldCard extends StatelessWidget {
  const _FieldCard({required this.children});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppTheme.radiusLg),
        border: Border.all(color: AppColors.border),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: 20,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppTheme.radiusLg - 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: children,
        ),
      ),
    );
  }
}

class _FieldDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(height: 1, color: AppColors.border);
  }
}

class _PasswordToggleButton extends StatelessWidget {
  const _PasswordToggleButton({
    required this.isObscured,
    required this.onToggle,
  });

  final bool isObscured;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onToggle,
      tooltip: isObscured ? 'Show password' : 'Hide password',
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: Icon(
          isObscured
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
          key: ValueKey(isObscured),
          size: 20,
          color: AppColors.textSecondary,
        ),
      ),
    );
  }
}

class _ForgotPasswordLink extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => context.go('/forgot-password'),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: const Text('Forgot Password?'),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({required this.isLoading, required this.onPressed});

  final bool isLoading;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        onPressed: onPressed,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: isLoading
              ? const SizedBox(
                  key: ValueKey('loading'),
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    color: Colors.white,
                  ),
                )
              : const Text(
                  'Sign In',
                  key: ValueKey('label'),
                ),
        ),
      ),
    );
  }
}

class _SignUpLink extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.textSecondary,
              ),
        ),
        TextButton(
          onPressed: () => context.go('/register'),
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 0),
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: const Text('Sign Up'),
        ),
      ],
    );
  }
}
