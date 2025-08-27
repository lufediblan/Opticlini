import 'package:flutter/material.dart';
import 'features/auth/presentation/pages/login_page.dart';
import 'features/auth/presentation/pages/register_page.dart';
import 'features/patient/presentation/pages/patient_home_page.dart';
import 'features/patient/presentation/pages/recommendations_page.dart';

void main() {
  runApp(const OpticLiniApp());
}

class OpticLiniApp extends StatelessWidget {
  const OpticLiniApp({super.key});

  // Color principal (turquesa del Figma)
  static const Color brandTeal = Color(0xFF006D75);
  static const Color hintGray = Color(0xFFB8B8B8);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Opticlini Óptica',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        scaffoldBackgroundColor: Colors.white,
        primaryColor: brandTeal,

        // Texto por defecto
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 16.0),
        ),

        // Botón de texto: “Iniciar Sesion”, “Registrate”
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: brandTeal,
            textStyle: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              letterSpacing: .2,
            ),
          ),
        ),

        // Campos de texto: rellenos, bordes redondeados, iconos grises
        inputDecorationTheme: InputDecorationTheme(
          isDense: true,
          filled: true,
          fillColor: Colors.white,
          hintStyle: const TextStyle(color: hintGray, fontWeight: FontWeight.w600),
          prefixIconColor: Colors.grey.shade700,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: brandTeal, width: 1.4),
          ),
        ),

        // Elevados si los necesitas luego
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: brandTeal,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            minimumSize: const Size.fromHeight(48),
            textStyle: const TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
      ),

      // Rutas
      initialRoute: '/',
      routes: {
        '/': (_) => const LoginPage(),
        '/register': (_) => const RegisterPage(),
        '/patient/home': (_) => const PatientHomePage(),
        '/recommendations': (_) => const RecommendationsPage(),
      },
    );
  }
}
