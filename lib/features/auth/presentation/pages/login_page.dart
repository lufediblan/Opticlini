import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isPaciente = true;

  void _handleLogin() {
    if (isPaciente) {
      // Navega al Home del Paciente y reemplaza el login
      Navigator.pushReplacementNamed(context, '/patient/home');
    } else {
      // TODO: cuando tengas el home de Óptica, cambia esta ruta
      // Navigator.pushReplacementNamed(context, '/optica/home');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Ruta de Óptica aún no configurada')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 30),
              // LOGO
              Center(
                child: Image.asset(
                  "assets/logo.png",
                  height: 120,
                ),
              ),
              const SizedBox(height: 40),

              // TABS
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _tabButton("Paciente", isPaciente, () {
                    setState(() => isPaciente = true);
                  }),
                  const SizedBox(width: 10),
                  _tabButton("Optica", !isPaciente, () {
                    setState(() => isPaciente = false);
                  }),
                ],
              ),
              const SizedBox(height: 30),

              // FORMULARIOS
              if (isPaciente) _pacienteForm() else _opticaForm(),

              const SizedBox(height: 40),

              // BOTÓN LOGIN
              TextButton(
                onPressed: _handleLogin, // ← ahora navega
                child: const Text(
                  "Iniciar Sesion",
                  style: TextStyle(
                    color: Color(0xFF006D75),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tabButton(String text, bool active, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: active ? const Color(0xFF006D75) : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: active ? Colors.white : Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget _pacienteForm() {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: "Documento de Identidad",
            prefixIcon: const Icon(Icons.person_outline),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget _opticaForm() {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: "Nombre del profesional",
            prefixIcon: const Icon(Icons.person_outline),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 15),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            hintText: "Contraseña",
            prefixIcon: const Icon(Icons.lock_outline),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Align(
          alignment: Alignment.centerLeft,
          child: GestureDetector(
            onTap: () {
              // Aquí navegamos a RegisterPage
              Navigator.pushNamed(context, "/register");
            },
            child: const Text(
              "Registrate",
              style: TextStyle(
                color: Color(0xFF006D75),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
