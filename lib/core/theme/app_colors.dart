import 'package:flutter/material.dart';

/// ShopNest Design Token System
/// Material 3 compliant — solid colors only, no gradients.
///
/// Palette: Sky Blue primary (#006397), Vibrant Orange CTAs (#FD8B00).
/// Neutral scale from surface (#F7F9FB) to container-lowest (#FFFFFF).
abstract final class AppColors {
  // ── Brand ─────────────────────────────────────────────────────────────────
  /// Primary — Sky Blue
  static const Color primary = Color(0xFF006397);

  /// Primary pressed / hover state — Dark Blue
  static const Color primaryDark = Color(0xFF004166);

  /// Primary container (chip bg, icon containers) — Light Blue
  static const Color primaryContainer = Color(0xFF3DB1FF);

  /// On-primary container text
  static const Color onPrimaryContainer = Color(0xFF004166);

  // ── Secondary (CTA) ───────────────────────────────────────────────────────
  /// Secondary — Brown/Orange (less prominent actions)
  static const Color secondary = Color(0xFF904D00);

  /// On-secondary text
  static const Color onSecondary = Color(0xFFFFFFFF);

  /// Secondary container — Vibrant Orange (primary CTAs)
  static const Color secondaryContainer = Color(0xFFFD8B00);

  /// On-secondary container text
  static const Color onSecondaryContainer = Color(0xFF603100);

  // ── Tertiary ───────────────────────────────────────────────────────────────
  static const Color tertiary = Color(0xFF565E74);

  static const Color onTertiary = Color(0xFFFFFFFF);

  // ── Surface & Background ──────────────────────────────────────────────────
  /// App background — light gray
  static const Color background = Color(0xFFF7F9FB);

  /// Card / form surface — pure white
  static const Color surface = Color(0xFFFFFFFF);

  /// Elevated surface (modals, bottom sheets)
  static const Color surfaceElevated = Color(0xFFFFFFFF);

  static const Color surfaceContainerHighest = Color(0xFFE0E3E5);

  /// App bar / header tint
  static const Color appBarBackground = Color(0xFFFFFFFF);

  // ── Text ──────────────────────────────────────────────────────────────────
  /// Primary text — near-black
  static const Color textPrimary = Color(0xFF191C1E);

  /// Secondary / supporting text
  static const Color textSecondary = Color(0xFF3F4851);

  /// Placeholder / hint text
  static const Color textHint = Color(0xFF6F7882);

  /// Disabled text
  static const Color textDisabled = Color(0xFFBEC7D3);

  /// Text on primary-colored surfaces (buttons)
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  // ── Border & Divider ──────────────────────────────────────────────────────
  /// Default input border — light gray
  static const Color border = Color(0xFFE2E8F0);

  /// Focused input border — uses primary
  static const Color borderFocused = primary;

  /// Divider
  static const Color divider = Color(0xFFF1F5F9);

  static const Color outline = Color(0xFF6F7882);

  static const Color outlineVariant = Color(0xFFBEC7D3);

  static const Color onSurfaceVariant = Color(0xFF3F4851);

  // ── Semantic ──────────────────────────────────────────────────────────────
  /// Success — Emerald 500
  static const Color success = Color(0xFF10B981);

  /// Success container
  static const Color successContainer = Color(0xFFECFDF5);

  /// Error
  static const Color error = Color(0xFFBA1A1A);

  /// Error container
  static const Color errorContainer = Color(0xFFFFDAD6);

  static const Color onErrorContainer = Color(0xFF93000A);

  /// Warning — Amber 500
  static const Color warning = Color(0xFFF59E0B);

  /// Info — Sky 500
  static const Color info = Color(0xFF0EA5E9);

  // ── Rule-check states ─────────────────────────────────────────────────────
  /// Neutral rule (not yet interacted)
  static const Color ruleNeutral = Color(0xFFCBD5E1);

  /// Rule met
  static const Color ruleMet = Color(0xFF10B981);

  /// Rule failed (user has typed)
  static const Color ruleFailed = Color(0xFFF43F5E);

  // ── Shadow ────────────────────────────────────────────────────────────────
  /// Card shadow — black at 4%
  static const Color shadowColor = Color(0x0A000000);

  // ── Legacy aliases (keeps existing imports compiling) ─────────────────────
  @Deprecated('Use textPrimary')
  static const Color text = textPrimary;

  @Deprecated('Use textSecondary')
  static const Color secondaryDeprecated = textSecondary;

  @Deprecated('Use primary')
  static const Color accent = primary;

  @Deprecated('Use background')
  static const Color backgroundAlt = background;
}
