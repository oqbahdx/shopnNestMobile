import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../widgets/register_form.dart';

/// Registration page.
///
/// Design improvements over the original:
///
/// 1. **AppBar** — transparent, back-arrow only, blends with page background.
///    The original used `AppColors.primary` which created a jarring color break.
///
/// 2. **Logotype mark** — replaces the generic shopping-bag icon with an "SN"
///    monogram in the brand primary color on a `primaryContainer` surface.
///    More distinctive and on-brand for a premium commerce app.
///
/// 3. **Typography hierarchy** — `headlineSmall` headline + a softer subtitle
///    with tighter line-height. Weight contrast between the two improves scan.
///
/// 4. **Layout** — generous top padding, balanced spacing between sections,
///    max-width constraint (400 px) keeps the form readable on tablets.
///
/// 5. **Footer** — a subtle terms-of-service line at the bottom is a common
///    trust signal for registration screens (copy is a placeholder; wire up
///    real routes when available).
class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      // Transparent app bar — just shows the system back button.
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
              // Keep form comfortable on large screens / tablets.
              constraints: const BoxConstraints(maxWidth: 400),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // ── Brand mark ────────────────────────────────────────────
                  const Center(child: _BrandMark()),

                  const SizedBox(height: AppTheme.space2xl),

                  // ── Headline ──────────────────────────────────────────────
                  Text(
                    'Create your account',
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
                    'Join ShopNest and start shopping today.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.textSecondary,
                          height: 1.5,
                        ),
                  ),

                  const SizedBox(height: AppTheme.space2xl),

                  // ── Form ──────────────────────────────────────────────────
                  const RegisterForm(),

                  const SizedBox(height: AppTheme.space2xl),

                  // ── Terms footer ──────────────────────────────────────────
                  const _TermsFooter(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ────────────────────────────────────────────────────────────────────────────
// Private sub-widgets
// ────────────────────────────────────────────────────────────────────────────

/// "SN" monogram brand mark — clean, scalable, no icon dependency.
class _BrandMark extends StatelessWidget {
  const _BrandMark();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68,
      width: 68,
      decoration: BoxDecoration(
        color: AppColors.primaryContainer,
        borderRadius: BorderRadius.circular(AppTheme.radiusLg),
        border: Border.all(
          color: AppColors.primary.withAlpha(38), // ~15% opacity
          width: 1.5,
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        'SN',
        style: TextStyle(
          color: AppColors.primary,
          fontSize: 22,
          fontWeight: FontWeight.w800,
          letterSpacing: -0.5,
          height: 1,
        ),
      ),
    );
  }
}

/// A brief legal notice that boosts trust on sign-up screens.
/// Tap targets are intentionally small — this is secondary UI.
class _TermsFooter extends StatelessWidget {
  const _TermsFooter();

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodySmall?.copyWith(
          color: AppColors.textHint,
          fontSize: 12,
          height: 1.6,
        );

    final linkStyle = style?.copyWith(
      color: AppColors.textSecondary,
      decoration: TextDecoration.underline,
      decorationColor: AppColors.textHint,
    );

    return Text.rich(
      TextSpan(
        style: style,
        children: [
          const TextSpan(text: 'By creating an account you agree to our '),
          TextSpan(text: 'Terms of Service', style: linkStyle),
          const TextSpan(text: ' and '),
          TextSpan(text: 'Privacy Policy', style: linkStyle),
          const TextSpan(text: '.'),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}