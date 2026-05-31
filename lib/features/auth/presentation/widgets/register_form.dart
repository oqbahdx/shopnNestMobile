import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/services/toast/toast_service.dart';
import '../bloc/register/register_bloc.dart';
import '../../../../injection.dart';
import 'auth_text_field.dart';
import 'password_rules_checklist.dart';

/// Registration form.
///
/// Design improvements:
/// - Form fields grouped in a subtle surface card — distinguishes inputs from
///   the page background without heavy borders.
/// - Password section has its own visual grouping with the rules checklist
///   integrated naturally below the field.
/// - CTA button uses the primary brand color with a full-width press state.
/// - "Already have an account" row sits cleanly below without excess padding.
/// - [_onSubmit] toast priority logic preserved; redundant fallback removed.
class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _nameFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameFocus.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  // ── Validators ─────────────────────────────────────────────────────────────

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

  String? _fullNameValidator(String? value) {
    final requiredError = _requiredValidator(value);
    if (requiredError != null) return requiredError;

    final parts = value!
        .trim()
        .split(RegExp(r'\s+'))
        .where((p) => p.isNotEmpty)
        .toList();
    if (parts.length < 2) return 'Please enter your first and last name';
    return null;
  }

  String? _passwordValidator(String? value) {
    final requiredError = _requiredValidator(value);
    if (requiredError != null) return requiredError;

    if (!context.read<RegisterBloc>().state.isPasswordStrong) {
      return 'Password does not meet all requirements';
    }
    return null;
  }

  // ── Submission ─────────────────────────────────────────────────────────────

  Future<void> _onSubmit() async {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) {
      final toast = getIt<ToastService>();

      // Show the first failing field's message as a toast for accessibility.
      final fullNameError = _fullNameValidator(_fullNameController.text);
      if (fullNameError != null) {
        await toast.showError(fullNameError);
        return;
      }

      final emailError = _emailValidator(_emailController.text);
      if (emailError != null) {
        await toast.showError(emailError);
        return;
      }

      final state = context.read<RegisterBloc>().state;
      if (!state.hasMinLength) {
        await toast.showError('Password must be at least 8 characters');
        return;
      }
      if (!state.hasUppercase) {
        await toast.showError('Add at least one uppercase letter');
        return;
      }
      if (!state.hasLowercase) {
        await toast.showError('Add at least one lowercase letter');
        return;
      }
      if (!state.hasNumber) {
        await toast.showError('Add at least one number');
        return;
      }
      if (!state.hasSpecialCharacter) {
        await toast.showError('Add at least one special character');
        return;
      }

      await toast.showError('Please fix the highlighted fields');
      return;
    }

    final fullName = _fullNameController.text.trim();
    final parts = fullName
        .split(RegExp(r'\s+'))
        .where((p) => p.isNotEmpty)
        .toList();
    final firstName = parts.isNotEmpty ? parts.first : '';
    final lastName = parts.length > 1 ? parts.sublist(1).join(' ') : '';

    context.read<RegisterBloc>().add(
          RegisterEvent.submitted(
            firstName: firstName,
            lastName: lastName,
            email: _emailController.text.trim(),
            password: _passwordController.text,
            confirmPassword: _passwordController.text,
          ),
        );
  }

  // ── Reset ──────────────────────────────────────────────────────────────────

  void _resetForm(RegisterState state) {
    _formKey.currentState?.reset();
    _fullNameController.clear();
    _emailController.clear();
    _passwordController.clear();
    context.read<RegisterBloc>().add(const RegisterEvent.passwordChanged(''));
    if (!state.isPasswordObscured) {
      context
          .read<RegisterBloc>()
          .add(const RegisterEvent.passwordVisibilityToggled());
    }
  }

  // ── Build ──────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) async {
        await state.when(
          initial: (_, __, ___, ____, _____, ______, _______) async {},
          loading: (_, __, ___, ____, _____, ______, _______) async {},
          success: (result, _, __, ___, ____, _____, ______, _______) async {
            await getIt<ToastService>().showSuccess(result.data);
            _resetForm(state);
            if (context.mounted) context.go('/login');
          },
          failure: (message, _, __, ___, ____, _____, ______, _______) async {
            await getIt<ToastService>().showError(message);
          },
        );
      },
      child: BlocSelector<RegisterBloc, RegisterState, bool>(
        selector: (state) => state.maybeWhen(
          loading: (_, __, ___, ____, _____, ______, _______) => true,
          orElse: () => false,
        ),
        builder: (context, isLoading) => AbsorbPointer(
          absorbing: isLoading,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // ── Field card ─────────────────────────────────────────────
                _FieldCard(
                  children: [
                    // Full Name
                    AuthTextField(
                      controller: _fullNameController,
                      focusNode: _nameFocus,
                      label: 'Full name',
                      validator: _fullNameValidator,
                      prefixIcon: Icons.person_outline_rounded,
                      textInputAction: TextInputAction.next,
                      autofillHints: const [AutofillHints.name],
                      onFieldSubmitted: (_) => _emailFocus.requestFocus(),
                    ),

                    _FieldDivider(),

                    // Email
                    AuthTextField(
                      controller: _emailController,
                      focusNode: _emailFocus,
                      label: 'Email address',
                      keyboardType: TextInputType.emailAddress,
                      validator: _emailValidator,
                      prefixIcon: Icons.alternate_email_rounded,
                      textInputAction: TextInputAction.next,
                      autofillHints: const [AutofillHints.email],
                      onFieldSubmitted: (_) => _passwordFocus.requestFocus(),
                    ),

                    _FieldDivider(),

                    // Password
                    BlocSelector<RegisterBloc, RegisterState, bool>(
                      selector: (state) => state.isPasswordObscured,
                      builder: (context, isObscured) => AuthTextField(
                        controller: _passwordController,
                        focusNode: _passwordFocus,
                        label: 'Password',
                        obscureText: isObscured,
                        validator: _passwordValidator,
                        prefixIcon: Icons.lock_outline_rounded,
                        textInputAction: TextInputAction.done,
                        autofillHints: const [AutofillHints.newPassword],
                        onChanged: (value) => context
                            .read<RegisterBloc>()
                            .add(RegisterEvent.passwordChanged(value)),
                        onFieldSubmitted: (_) => _onSubmit(),
                        suffixIcon: _PasswordToggleButton(
                          isObscured: isObscured,
                          onToggle: () => context
                              .read<RegisterBloc>()
                              .add(
                                const RegisterEvent
                                    .passwordVisibilityToggled(),
                              ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                // ── Password rules ─────────────────────────────────────────
                BlocSelector<RegisterBloc, RegisterState,
                    _PasswordRulesState>(
                  selector: (state) => _PasswordRulesState(
                    hasMinLength: state.hasMinLength,
                    hasUppercase: state.hasUppercase,
                    hasLowercase: state.hasLowercase,
                    hasNumber: state.hasNumber,
                    hasSpecialCharacter: state.hasSpecialCharacter,
                    hasInteracted: _passwordController.text.isNotEmpty,
                  ),
                  builder: (context, rules) => PasswordRulesChecklist(
                    hasMinLength: rules.hasMinLength,
                    hasUppercase: rules.hasUppercase,
                    hasLowercase: rules.hasLowercase,
                    hasNumber: rules.hasNumber,
                    hasSpecialCharacter: rules.hasSpecialCharacter,
                    hasInteracted: rules.hasInteracted,
                  ),
                ),

                const SizedBox(height: 24),

                // ── CTA button ─────────────────────────────────────────────
                _RegisterButton(isLoading: isLoading, onPressed: _onSubmit),

                const SizedBox(height: 20),

                // ── Login link ─────────────────────────────────────────────
                _LoginLink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ────────────────────────────────────────────────────────────────────────────
// Private sub-widgets — kept in this file for colocation; extract to their
// own files if this form grows significantly.
// ────────────────────────────────────────────────────────────────────────────

/// Wraps auth fields in a unified surface card.
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
            blurRadius: 6,
            offset: Offset(0, 2),
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

/// A hairline divider between fields inside the card.
class _FieldDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(height: 1, color: AppColors.border);
  }
}

/// Show/hide password icon button with accessible tooltip.
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

/// Primary CTA — handles loading state inline.
class _RegisterButton extends StatelessWidget {
  const _RegisterButton({required this.isLoading, required this.onPressed});

  final bool isLoading;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
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
                  'Create Account',
                  key: ValueKey('label'),
                ),
        ),
      ),
    );
  }
}

/// "Already have an account? Log in" row.
class _LoginLink extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account?',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.textSecondary,
              ),
        ),
        TextButton(
          onPressed: () => context.go('/login'),
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 0),
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: const Text('Log in'),
        ),
      ],
    );
  }
}

/// Immutable value object for BlocSelector — avoids rebuilding the checklist
/// on every keystroke by packaging all five rule booleans together.
class _PasswordRulesState {
  const _PasswordRulesState({
    required this.hasMinLength,
    required this.hasUppercase,
    required this.hasLowercase,
    required this.hasNumber,
    required this.hasSpecialCharacter,
    required this.hasInteracted,
  });

  final bool hasMinLength;
  final bool hasUppercase;
  final bool hasLowercase;
  final bool hasNumber;
  final bool hasSpecialCharacter;
  final bool hasInteracted;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _PasswordRulesState &&
          other.hasMinLength == hasMinLength &&
          other.hasUppercase == hasUppercase &&
          other.hasLowercase == hasLowercase &&
          other.hasNumber == hasNumber &&
          other.hasSpecialCharacter == hasSpecialCharacter &&
          other.hasInteracted == hasInteracted;

  @override
  int get hashCode => Object.hash(
        hasMinLength,
        hasUppercase,
        hasLowercase,
        hasNumber,
        hasSpecialCharacter,
        hasInteracted,
      );
}