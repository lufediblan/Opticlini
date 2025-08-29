import 'package:flutter/material.dart';
import '../../../core/widgets/custom_page_header.dart';

class RemovePatientPage extends StatelessWidget {
  const RemovePatientPage({super.key});

  static const Color brandTeal = Color(0xFF05738D);
  static const Color disabledGray = Color(0xFFB8B8B8);

  Widget _disabledField(String hint, IconData icon) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: TextField(
        enabled: false,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: disabledGray),
          prefixIcon: Icon(icon, color: disabledGray),
          filled: true,
          fillColor: const Color(0xFFF0F0F0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _doubleDisabled(String hint1, IconData icon1, String hint2, IconData icon2) {
    return Row(
      children: [
        Expanded(child: _disabledField(hint1, icon1)),
        const SizedBox(width: 8),
        Expanded(child: _disabledField(hint2, icon2)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F9),
      body: SafeArea(
        child: Column(
          children: [
            const CustomPageHeader(title: 'Eliminar paciente'),

            // ========== CARD DE CAMPOS ==========
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x1F000000),
                    blurRadius: 12,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0, bottom: 8),
                    child: Text(
                      'Eliminar paciente',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  _doubleDisabled("Tipo de documento", Icons.list, "Numero de documento", Icons.numbers),
                  _doubleDisabled("Nombre", Icons.person, "Segundo Nombre", Icons.person_outline),
                  _doubleDisabled("Apellido", Icons.person, "Segundo Apellido", Icons.person_outline),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'Nota: Este procedimiento es para eliminar la historia clínica completa del paciente',
                style: TextStyle(fontSize: 14),
              ),
            ),

            const SizedBox(height: 28),

            ElevatedButton(
              onPressed: () {
                // TODO: Acción de eliminación
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: brandTeal,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text(
                'Eliminar Paciente',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
