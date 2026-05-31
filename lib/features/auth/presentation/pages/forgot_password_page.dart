import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/services/toast/toast_service.dart';
import '../../../../injection.dart';
import '../bloc/forgot_password/forgot_password_bloc.dart';
import '../widgets/auth_text_field.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ForgotPasswordBloc>(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          foregroundColor: AppColors.textPrimary,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(
              AppTheme.spaceLg,
              AppTheme.spaceLg,
              AppTheme.spaceLg,
              AppTheme.space3xl,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 400),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Reset Password',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.4,
                            height: 1.2,
                          ),
                    ),
                    const SizedBox(height: AppTheme.spaceSm),
                    Text(
                      "Enter your email address and we'll send you a link to reset your password.",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.textSecondary,
                            height: 1.5,
                          ),
                    ),
                    const SizedBox(height: AppTheme.space2xl),
                    const _ForgotPasswordForm(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ForgotPasswordForm extends StatefulWidget {
  const _ForgotPasswordForm();

  @override
  State<_ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<_ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _emailFocus = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _emailFocus.dispose();
    super.dispose();
  }

  String? _emailValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Enter your email address';
    }
    final isValid = RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(value.trim());
    if (!isValid) return 'Enter a valid email address';
    return null;
  }

  Future<void> _onSubmit() async {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) {
      final toast = getIt<ToastService>();
      await toast.showError('Please enter a valid email address');
      return;
    }

    context.read<ForgotPasswordBloc>().add(
          ForgotPasswordEvent.submitted(
            email: _emailController.text.trim(),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
      listener: (context, state) async {
        await state.when(
          initial: () async {},
          loading: () async {},
          success: (message) async {
            await getIt<ToastService>().showSuccess(message);
          },
          failure: (message) async {
            await getIt<ToastService>().showError(message);
          },
        );
      },
      child: BlocSelector<ForgotPasswordBloc, ForgotPasswordState, _ForgotPasswordViewState>(
        selector: (state) => state.maybeWhen(
          loading: () => const _ForgotPasswordViewState(isLoading: true),
          success: (message) => _ForgotPasswordViewState(isSuccess: true, message: message),
          orElse: () => const _ForgotPasswordViewState(),
        ),
        builder: (context, viewState) {
          if (viewState.isSuccess) {
            return _SuccessView(message: viewState.message!);
          }

          return AbsorbPointer(
            absorbing: viewState.isLoading,
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
                        textInputAction: TextInputAction.done,
                        autofillHints: const [AutofillHints.email],
                        onFieldSubmitted: (_) => _onSubmit(),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppTheme.space2xl),
                  SizedBox(
                    height: 48,
                    child: ElevatedButton(
                      onPressed: _onSubmit,
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 200),
                        child: viewState.isLoading
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
                                'Send Reset Link',
                                key: ValueKey('label'),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
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

class _SuccessView extends StatelessWidget {
  const _SuccessView({required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            color: AppColors.successContainer,
            borderRadius: BorderRadius.circular(AppTheme.radiusFull),
          ),
          alignment: Alignment.center,
          child: const Icon(
            Icons.check_rounded,
            size: 40,
            color: AppColors.success,
          ),
        ),
        const SizedBox(height: AppTheme.space2xl),
        Text(
          message,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.textSecondary,
                height: 1.5,
              ),
        ),
      ],
    );
  }
}

class _ForgotPasswordViewState {
  const _ForgotPasswordViewState({
    this.isLoading = false,
    this.isSuccess = false,
    this.message,
  });

  final bool isLoading;
  final bool isSuccess;
  final String? message;
}
