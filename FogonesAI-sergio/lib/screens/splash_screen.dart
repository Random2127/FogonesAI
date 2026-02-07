import 'package:flutter/material.dart';
import 'package:fogonesia/utils/routes.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkStatusAndNavigate();
  }

_checkStatusAndNavigate() async {
    await Future.delayed(const Duration(milliseconds: 2500));
    if (!mounted) return;

    // Directo al Home sin escalas
    Navigator.pushReplacementNamed(context, Routes.home);
  }

  @override
  Widget build(BuildContext context) {
    // Obtenemos el tema completo para acceder a todas sus propiedades
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              colors.surface, 
              theme.scaffoldBackgroundColor, // Corregido: accedemos a theme directamente
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animación sutil de escala para el logo
            TweenAnimationBuilder(
              duration: const Duration(seconds: 2),
              tween: Tween<double>(begin: 0.8, end: 1.1),
              builder: (context, double value, child) {
                return Transform.scale(
                  scale: value,
                  child: Icon(
                    Icons.local_fire_department_rounded,
                    size: 100,
                    color: colors.primary,
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
            Text(
              'FOGONES AI',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                letterSpacing: 4,
                color: colors.primary,
              ),
            ),
            const SizedBox(height: 10),

        Text(
         'FOGONES AI',
         style: TextStyle(
        fontSize: 16,
         // Usamos withValues en lugar de withOpacity
         color: colors.onSurface.withValues(alpha: 0.7), 
         fontStyle: FontStyle.italic,
         ),
        ),
            const SizedBox(height: 80), 
            SizedBox(
              width: 40,
              height: 40,
              child: CircularProgressIndicator(
                color: colors.primary,
                strokeWidth: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}