import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

/// Password rules checklist with three visual states:
///
/// - **Neutral** (`hasInteracted = false`): Slate-300 dot — the user hasn't
///   typed yet so we don't punish them with red crosses immediately.
/// - **Met** (`isMet = true`): Emerald check-circle — rule satisfied.
/// - **Failed** (`isMet = false`, after interaction): Rose X — rule not met.
///
/// The [hasInteracted] flag is `true` once the user has typed at least one
/// character in the password field. Pass it from the parent so the checklist
/// stays neutral until the user actually engages.
class PasswordRulesChecklist extends StatelessWidget {
  const PasswordRulesChecklist({
    super.key,
    required this.hasMinLength,
    required this.hasUppercase,
    required this.hasLowercase,
    required this.hasNumber,
    required this.hasSpecialCharacter,
    this.hasInteracted = false,
  });

  final bool hasMinLength;
  final bool hasUppercase;
  final bool hasLowercase;
  final bool hasNumber;
  final bool hasSpecialCharacter;

  /// Whether the user has started typing in the password field.
  /// When false, all rules render in a neutral/grey state.
  final bool hasInteracted;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Password requirements',
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.6,
                ),
          ),
          const SizedBox(height: 10),
          _RuleRow(
            isMet: hasMinLength,
            label: 'At least 8 characters',
            hasInteracted: hasInteracted,
          ),
          _RuleRow(
            isMet: hasUppercase,
            label: 'One uppercase letter (A–Z)',
            hasInteracted: hasInteracted,
          ),
          _RuleRow(
            isMet: hasLowercase,
            label: 'One lowercase letter (a–z)',
            hasInteracted: hasInteracted,
          ),
          _RuleRow(
            isMet: hasNumber,
            label: 'One number (0–9)',
            hasInteracted: hasInteracted,
          ),
          _RuleRow(
            isMet: hasSpecialCharacter,
            label: 'One special character (!@#\$…)',
            hasInteracted: hasInteracted,
            isLast: true,
          ),
        ],
      ),
    );
  }
}

class _RuleRow extends StatelessWidget {
  const _RuleRow({
    required this.isMet,
    required this.label,
    required this.hasInteracted,
    this.isLast = false,
  });

  final bool isMet;
  final String label;
  final bool hasInteracted;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final Color iconColor;
    final IconData iconData;

    if (!hasInteracted) {
      iconColor = AppColors.ruleNeutral;
      iconData = Icons.circle_outlined;
    } else if (isMet) {
      iconColor = AppColors.ruleMet;
      iconData = Icons.check_circle_rounded;
    } else {
      iconColor = AppColors.ruleFailed;
      iconData = Icons.cancel_rounded;
    }

    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 7),
      child: Row(
        children: [
          // Animated icon swap
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 220),
            transitionBuilder: (child, animation) => ScaleTransition(
              scale: animation,
              child: FadeTransition(opacity: animation, child: child),
            ),
            child: Icon(
              iconData,
              key: ValueKey('${iconData.codePoint}_$iconColor'),
              size: 15,
              color: iconColor,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 180),
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                height: 1.3,
                color: hasInteracted && isMet
                    ? AppColors.ruleMet
                    : hasInteracted
                        ? AppColors.textSecondary
                        : AppColors.textSecondary,
              ),
              child: Text(label),
            ),
          ),
        ],
      ),
    );
  }
}