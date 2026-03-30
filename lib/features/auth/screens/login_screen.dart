import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogonesia/features/auth/auth_providers.dart';
import 'package:fogonesia/shared/widgets/big_button.dart';
import 'package:fogonesia/shared/widgets/google_auth_button.dart';
import 'package:go_router/go_router.dart';

class Login extends ConsumerStatefulWidget {
  const Login({super.key});

  @override
  ConsumerState<Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  bool _obscurePassword = true;
  bool _busy = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    if (email.isEmpty || password.isEmpty) {
      _showMessage('Introduce correo y contraseña.');
      return;
    }
    setState(() => _busy = true);
    final auth = ref.read(authServiceProvider);
    final err = await auth.signInWithEmail(email: email, password: password);
    if (!mounted) return;
    setState(() => _busy = false);
    if (err != null) {
      _showMessage(err);
      return;
    }
    context.go('/home');
  }

  Future<void> _forgotPassword() async {
    final email = _emailController.text.trim();
    final auth = ref.read(authServiceProvider);
    final err = await auth.sendPasswordResetEmail(email);
    if (!mounted) return;
    if (err != null) {
      _showMessage(err);
    } else {
      _showMessage('Revisa tu correo para restablecer la contraseña.');
    }
  }

  void _showMessage(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  Future<void> _signInWithGoogle() async {
    setState(() => _busy = true);
    final auth = ref.read(authServiceProvider);
    final err = await auth.signInWithGoogle();
    if (!mounted) return;
    setState(() => _busy = false);
    if (err == null) {
      context.go('/home');
      return;
    }
    if (err.isEmpty) {
      return;
    }
    _showMessage(err);
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.displayLarge?.copyWith(
          color: scheme.onSurface,
        );
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Center(
            child: Container(
              width: 380,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: scheme.surface,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: scheme.primary.withValues(alpha: 0.25),
                  width: 1.5,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Iniciar sesión', style: titleStyle),
                  const SizedBox(height: 20),
                  _field(
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      enabled: !_busy,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email, color: scheme.primary),
                        hintText: 'Ejemplo@Correo.com',
                        filled: true,
                        fillColor: scheme.primary.withValues(alpha: 0.06),
                        enabledBorder: _authBorder(scheme),
                        focusedBorder: _authBorder(scheme),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _field(
                    child: TextField(
                      obscureText: _obscurePassword,
                      controller: _passwordController,
                      enabled: !_busy,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock, color: scheme.primary),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: _busy
                              ? null
                              : () {
                                  setState(
                                    () => _obscurePassword = !_obscurePassword,
                                  );
                                },
                        ),
                        hintText: 'Contraseña',
                        filled: true,
                        fillColor: scheme.primary.withValues(alpha: 0.06),
                        enabledBorder: _authBorder(scheme),
                        focusedBorder: _authBorder(scheme),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: _busy ? null : _forgotPassword,
                      child: Text(
                        '¿Has olvidado tu contraseña?',
                        style: TextStyle(
                          color: scheme.secondary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  BigButton(
                    text: _busy ? 'Entrando…' : 'Iniciar sesión',
                    onPressed: _busy ? null : _submit,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(color: scheme.outline.withValues(alpha: 0.5)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          'o',
                          style: TextStyle(
                            color: scheme.onSurface.withValues(alpha: 0.6),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(color: scheme.outline.withValues(alpha: 0.5)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  GoogleAuthButton(
                    busy: _busy,
                    onPressed: _signInWithGoogle,
                  ),
                  const SizedBox(height: 20),
                  BigButton(
                    text: 'Registrarse',
                    onPressed: _busy ? null : () => context.go('/register'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  InputBorder _authBorder(ColorScheme scheme) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
        color: scheme.primary.withValues(alpha: 0.5),
        width: 1.5,
      ),
    );
  }

  Widget _field({required Widget child}) => SizedBox(width: 330, child: child);
}
