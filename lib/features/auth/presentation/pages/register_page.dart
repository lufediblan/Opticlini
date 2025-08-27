import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 30),
              Center(
                child: Image.asset("assets/logo.png", height: 120),
              ),
              const SizedBox(height: 40),

              _buildInput("Nombre del profesional", Icons.person_outline),
              _buildInput("NIT", Icons.badge_outlined),
              _buildInput("Correo", Icons.email_outlined),
              _buildInput("Contraseña", Icons.lock_outline, obscure: true),
              _buildInput("Nombre de la Óptica", Icons.business_outlined),
              _buildInput("Teléfono", Icons.phone_outlined),

              const SizedBox(height: 40),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Iniciar Sesion",
                  style: TextStyle(
                    color: Color(0xFF006D75),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInput(String hint, IconData icon, {bool obscure = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        obscureText: obscure,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(icon),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
