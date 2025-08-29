import 'package:flutter/material.dart';
import '../../../core/widgets/custom_page_header.dart';

class AddPatientPage extends StatelessWidget {
  const AddPatientPage({super.key});

  static const Color brandTeal = Color(0xFF05738D);

  Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: Text(text,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16)),
    );
  }

  Widget _doubleInput(String hint1, IconData icon1, String hint2, IconData icon2) {
    return Row(
      children: [
        Expanded(child: _inputField(hint1, icon1)),
        const SizedBox(width: 8),
        Expanded(child: _inputField(hint2, icon2)),
      ],
    );
  }

  Widget _inputField(String hint, IconData icon) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(icon),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F9),
      body: SafeArea(
        child: Column(
          children: [
            const CustomPageHeader(title: 'Agregar datos del paciente'),

            // ===== Formulario completo =====
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _sectionTitle("Identificación:"),
                    _doubleInput("Tipo de documento", Icons.list, "Numero de documento", Icons.numbers),
                    _doubleInput("Nombre", Icons.person, "Segundo Nombre", Icons.person_outline),
                    _doubleInput("Apellido", Icons.person, "Segundo Apellido", Icons.person_outline),
                    _doubleInput("Fecha de nacimiento", Icons.calendar_today, "Edad", Icons.cake),
                    _doubleInput("Sexo", Icons.wc, "RH", Icons.bloodtype),
                    _doubleInput("Estado de la Historia", Icons.info, "", Icons.info),

                    _sectionTitle("Contacto:"),
                    _doubleInput("Dirección", Icons.location_on, "Barrio", Icons.map),
                    _doubleInput("Telefono", Icons.phone, "Telefono", Icons.phone_android),
                    _inputField("Correo", Icons.email),
                    _doubleInput("Estado civil", Icons.group, "Ocupación", Icons.work),

                    _sectionTitle("Afiliación y usuario:"),
                    _inputField("EPS", Icons.health_and_safety),
                    _doubleInput("País", Icons.flag, "Departamento", Icons.location_city),
                    _doubleInput("Tipo de usuario", Icons.person, "Tipo de Afiliación", Icons.security),

                    _sectionTitle("Responsable / Acompañante:"),
                    _doubleInput("Nombre", Icons.person, "Apellido", Icons.person),
                    _doubleInput("Telefono", Icons.phone, "Telefono", Icons.phone),
                    _doubleInput("Tipo de documento", Icons.badge, "Numero de documento", Icons.credit_card),
                    _inputField("Parentesco", Icons.family_restroom),

                    const SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: brandTeal,
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          "Agregar paciente",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
