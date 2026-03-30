import 'package:flutter/material.dart';

/// Full-width styled button used on auth screens and similar flows.
class BigButton extends StatelessWidget {
  const BigButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.foregroundColor,
    this.width = 350,
    this.height = 60,
  });

  final String text;
  final VoidCallback? onPressed;
  final Color? foregroundColor;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final effectiveForeground = foregroundColor ?? scheme.onPrimary;
    return SizedBox(
      width: width,
      height: height,
      child: DecoratedBox(
        decoration: bigButtonsDecoration(context),
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(color: effectiveForeground, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  static BoxDecoration bigButtonsDecoration(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final background = scheme.primary;
    final shadowColor = scheme.primary.withValues(alpha: 0.25);
    return BoxDecoration(
      color: background,
      border: Border.all(width: 3, color: scheme.primary),
      borderRadius: const BorderRadius.all(Radius.circular(25)),
      boxShadow: [
        BoxShadow(
          color: shadowColor,
          spreadRadius: 5,
          blurRadius: 10,
          offset: Offset.zero,
        ),
      ],
    );
  }
}
