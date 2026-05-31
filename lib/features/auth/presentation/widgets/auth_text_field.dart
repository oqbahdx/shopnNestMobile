import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/theme/app_colors.dart';

/// A reusable text field for authentication screens.
///
/// Design principles:
/// - Fully theme-driven via [InputDecorationTheme] — no hardcoded colors.
/// - Subtle prefix icon that shifts to primary color on focus using
///   an [AnimatedBuilder] on a [FocusNode].
/// - Clean error state with rose border + error text (no icon clutter).
/// - Supports password obscure-toggle, input actions, and custom keyboard.
class AuthTextField extends StatefulWidget {
  const AuthTextField({
    super.key,
    required this.controller,
    required this.label,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.suffixIcon,
    this.textInputAction = TextInputAction.next,
    this.prefixIcon,
    this.onChanged,
    this.inputFormatters,
    this.autofillHints,
    this.focusNode,
    this.onFieldSubmitted,
  });

  final TextEditingController controller;
  final String label;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextInputAction textInputAction;
  final IconData? prefixIcon;
  final ValueChanged<String>? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final Iterable<String>? autofillHints;
  final FocusNode? focusNode;
  final ValueChanged<String>? onFieldSubmitted;

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  late final FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    if (mounted) setState(() => _isFocused = _focusNode.hasFocus);
  }

  @override
  void dispose() {
    // Only dispose if we created the node ourselves.
    if (widget.focusNode == null) {
      _focusNode
        ..removeListener(_onFocusChange)
        ..dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return TextFormField(
      controller: widget.controller,
      focusNode: _focusNode,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      textInputAction: widget.textInputAction,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onFieldSubmitted,
      inputFormatters: widget.inputFormatters,
      autofillHints: widget.autofillHints,
      cursorColor: colorScheme.primary,
      cursorWidth: 1.5,
      style: TextStyle(
        color: AppColors.textPrimary,
        fontSize: 15,
        fontWeight: FontWeight.w400,
        height: 1.4,
      ),
      decoration: InputDecoration(
        labelText: widget.label,
        prefixIcon: widget.prefixIcon == null
            ? null
            : AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                child: Icon(
                  widget.prefixIcon,
                  size: 20,
                  color: _isFocused
                      ? AppColors.primary
                      : AppColors.textSecondary,
                ),
              ),
        suffixIcon: widget.suffixIcon,
      ),
    );
  }
}