import 'package:flutter/material.dart';

/// Outlined button for “Sign in with Google” (theme-aligned, no hard-coded brand colors).
class GoogleAuthButton extends StatelessWidget {
  const GoogleAuthButton({
    super.key,
    required this.onPressed,
    this.busy = false,
    this.label = 'Continuar con Google',
    this.width = 330,
  });

  final VoidCallback? onPressed;
  final bool busy;
  final String label;
  final double width;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return SizedBox(
      width: width,
      height: 52,
      child: OutlinedButton.icon(
        onPressed: busy ? null : onPressed,
        icon: busy
            ? SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: scheme.primary,
                ),
              )
            : Icon(Icons.g_mobiledata, size: 28, color: scheme.primary),
        label: Text(
          busy ? 'Conectando…' : label,
          style: TextStyle(
            color: scheme.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: scheme.primary.withValues(alpha: 0.5)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
