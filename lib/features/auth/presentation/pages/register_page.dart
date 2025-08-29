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
              Center(child: Image.asset("assets/logo.png", height: 120)),
              const SizedBox(height: 40),

              _buildInput("Nombre del profesional", Icons.person_outline,
                  textCap: TextCapitalization.words),
              _buildInput("NIT", Icons.badge_outlined,
                  keyboard: TextInputType.number),
              _buildInput("Correo", Icons.email_outlined,
                  keyboard: TextInputType.emailAddress),
              _buildInput("Contraseña", Icons.lock_outline, obscure: true),
              _buildInput("Nombre de la Óptica", Icons.business_outlined,
                  textCap: TextCapitalization.words),
              _buildInput("Teléfono", Icons.phone_outlined,
                  keyboard: TextInputType.phone),

              const SizedBox(height: 40),

              // Acción (puedes reemplazar por tu lógica real de registro)
              TextButton(
                onPressed: () {
                  // después de registrar, vuelve al login
                  Navigator.pop(context);
                },
                child: const Text(
                  "Crear cuenta",
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

  Widget _buildInput(
      String hint,
      IconData icon, {
        bool obscure = false,
        TextInputType keyboard = TextInputType.text,
        TextCapitalization textCap = TextCapitalization.none,
      }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        obscureText: obscure,
        keyboardType: keyboard,
        textCapitalization: textCap,
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
