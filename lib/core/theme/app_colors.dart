import 'package:flutter/material.dart';

/// ShopNest Design Token System
/// Material 3 compliant — solid colors only, no gradients.
///
/// Palette origin: Indigo-600 primary on Slate-50 surface.
/// Neutral scale derived from Slate (blue-tinted grey) for a refined,
/// enterprise-grade look.
abstract final class AppColors {
  // ── Brand ─────────────────────────────────────────────────────────────────
  /// Primary brand color — Indigo 600
  static const Color primary = Color(0xFF4F46E5);

  /// Primary pressed / hover state — Indigo 700
  static const Color primaryDark = Color(0xFF4338CA);

  /// Primary container (chip bg, icon containers) — Indigo 50
  static const Color primaryContainer = Color(0xFFEEF2FF);

  /// On-primary container text/icon — Indigo 700
  static const Color onPrimaryContainer = Color(0xFF3730A3);

  // ── Surface & Background ──────────────────────────────────────────────────
  /// App background — Slate 50
  static const Color background = Color(0xFFF8FAFC);

  /// Card / form surface — pure white
  static const Color surface = Color(0xFFFFFFFF);

  /// Elevated surface (modals, bottom sheets) — white
  static const Color surfaceElevated = Color(0xFFFFFFFF);

  /// App bar / header tint — white
  static const Color appBarBackground = Color(0xFFFFFFFF);

  // ── Text ──────────────────────────────────────────────────────────────────
  /// Primary text — Slate 900
  static const Color textPrimary = Color(0xFF0F172A);

  /// Secondary / supporting text — Slate 500
  static const Color textSecondary = Color(0xFF64748B);

  /// Placeholder / hint text — Slate 400
  static const Color textHint = Color(0xFF94A3B8);

  /// Disabled text — Slate 300
  static const Color textDisabled = Color(0xFFCBD5E1);

  /// Text on primary-colored surfaces (buttons)
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  // ── Border & Divider ──────────────────────────────────────────────────────
  /// Default input border — Slate 200
  static const Color border = Color(0xFFE2E8F0);

  /// Focused input border — uses primary
  static const Color borderFocused = primary;

  /// Divider — Slate 100
  static const Color divider = Color(0xFFF1F5F9);

  // ── Semantic ──────────────────────────────────────────────────────────────
  /// Success — Emerald 500
  static const Color success = Color(0xFF10B981);

  /// Success container — Emerald 50
  static const Color successContainer = Color(0xFFECFDF5);

  /// Error — Rose 500
  static const Color error = Color(0xFFF43F5E);

  /// Error container — Rose 50
  static const Color errorContainer = Color(0xFFFFF1F2);

  /// Warning — Amber 500
  static const Color warning = Color(0xFFF59E0B);

  /// Info — Sky 500
  static const Color info = Color(0xFF0EA5E9);

  // ── Rule-check states ─────────────────────────────────────────────────────
  /// Neutral rule (not yet interacted) — Slate 300
  static const Color ruleNeutral = Color(0xFFCBD5E1);

  /// Rule met — Emerald 500
  static const Color ruleMet = Color(0xFF10B981);

  /// Rule failed (user has typed) — Rose 500
  static const Color ruleFailed = Color(0xFFF43F5E);

  // ── Shadow ────────────────────────────────────────────────────────────────
  /// Card shadow color
  static const Color shadowColor = Color(0x0D0F172A); // Slate-900 @ 5%

  // ── Stitch export tokens ─────────────────────────────────────────────────
  static const Color stitchSurface = Color(0xFFF7F9FB);
  static const Color stitchSurfaceContainerLowest = Color(0xFFFFFFFF);
  static const Color stitchSurfaceContainerLow = Color(0xFFF2F4F6);
  static const Color stitchSurfaceContainer = Color(0xFFECEEF0);
  static const Color stitchSurfaceContainerHigh = Color(0xFFE6E8EA);
  static const Color stitchSurfaceContainerHighest = Color(0xFFE0E3E5);
  static const Color stitchSurfaceTint = Color(0xFF006397);
  static const Color stitchPrimary = Color(0xFF006397);
  static const Color stitchPrimaryContainer = Color(0xFF3DB1FF);
  static const Color stitchOnPrimaryContainer = Color(0xFF004166);
  static const Color stitchPrimaryFixed = Color(0xFFCCE5FF);
  static const Color stitchOnPrimaryFixed = Color(0xFF001D31);
  static const Color stitchOnPrimaryFixedVariant = Color(0xFF004B73);
  static const Color stitchSecondary = Color(0xFF904D00);
  static const Color stitchSecondaryContainer = Color(0xFFFD8B00);
  static const Color stitchOnSecondaryContainer = Color(0xFF603100);
  static const Color stitchOnSecondary = Color(0xFFFFFFFF);
  static const Color stitchSecondaryFixed = Color(0xFFFFDCC3);
  static const Color stitchSecondaryFixedDim = Color(0xFFFFB77D);
  static const Color stitchOnSecondaryFixed = Color(0xFF2F1500);
  static const Color stitchOnSecondaryFixedVariant = Color(0xFF6E3900);
  static const Color stitchTertiary = Color(0xFF565E74);
  static const Color stitchTertiaryContainer = Color(0xFFA1A9C2);
  static const Color stitchOnTertiaryContainer = Color(0xFF363E53);
  static const Color stitchTertiaryFixed = Color(0xFFDAE2FD);
  static const Color stitchTertiaryFixedDim = Color(0xFFBEC6E0);
  static const Color stitchOnTertiaryFixed = Color(0xFF131B2E);
  static const Color stitchOnTertiary = Color(0xFFFFFFFF);
  static const Color stitchOnBackground = Color(0xFF191C1E);
  static const Color stitchOnSurface = Color(0xFF191C1E);
  static const Color stitchOnSurfaceVariant = Color(0xFF3F4851);
  static const Color stitchInverseOnSurface = Color(0xFFEFF1F3);
  static const Color stitchInverseSurface = Color(0xFF2D3133);
  static const Color stitchInversePrimary = Color(0xFF93CCFF);
  static const Color stitchOutline = Color(0xFF6F7882);
  static const Color stitchOutlineVariant = Color(0xFFBEC7D3);
  static const Color stitchError = Color(0xFFBA1A1A);
  static const Color stitchErrorContainer = Color(0xFFFFDAD6);
  static const Color stitchOnError = Color(0xFFFFFFFF);
  static const Color stitchOnErrorContainer = Color(0xFF93000A);
  static const Color onSurfaceVariant = Color(0xFF3F4851);
  static const Color outline = Color(0xFF6F7882);


  // ── Legacy aliases (keeps existing imports compiling) ─────────────────────
  @Deprecated('Use textPrimary')
  static const Color text = textPrimary;

  @Deprecated('Use textSecondary')
  static const Color secondary = textSecondary;

  @Deprecated('Use primary')
  static const Color accent = primary;

  @Deprecated('Use background')
  static const Color backgroundAlt = background;
}