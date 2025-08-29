import 'package:flutter/material.dart';
import '../../../core/widgets/custom_page_header.dart';

class OpticaPatientDataPage extends StatelessWidget {
  const OpticaPatientDataPage({super.key});

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
          prefixIcon: Icon(icon, color: brandTeal),
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

  Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 4),
      child: Text(
        text,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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
            const CustomPageHeader(title: 'Datos'),

            // ===== BOTÓN EDITAR =====
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: brandTeal,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text('Editar', style: TextStyle(fontSize: 16)),
              ),
            ),

            // ===== CONTENIDO =====
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _sectionTitle('Identificación:'),
                    _doubleDisabled('Tipo de documento', Icons.list, 'Numero de documento', Icons.numbers),
                    _doubleDisabled('Nombre', Icons.person, 'Segundo Nombre', Icons.person_outline),
                    _doubleDisabled('Apellido', Icons.person, 'Segundo Apellido', Icons.person_outline),
                    _doubleDisabled('Fecha de nacimiento', Icons.calendar_today, 'Edad', Icons.cake),
                    _doubleDisabled('Sexo', Icons.wc, 'RH', Icons.bloodtype),
                    _disabledField('Estado de la Historia', Icons.info),

                    _sectionTitle('Contacto:'),
                    _doubleDisabled('Dirección', Icons.location_on, 'Barrio', Icons.map),
                    _doubleDisabled('Telefono', Icons.phone, 'Telefono', Icons.phone_android),
                    _disabledField('Correo', Icons.email),
                    _doubleDisabled('Estado civil', Icons.group, 'Ocupación', Icons.work),

                    _sectionTitle('Afiliacion y usuario:'),
                    _disabledField('EPS', Icons.health_and_safety),
                    _doubleDisabled('País', Icons.flag, 'Departamento', Icons.location_city),
                    _doubleDisabled('Tipo de usuario', Icons.person, 'Tipo de Afiliación', Icons.security),

                    _sectionTitle('Responsable / Acompañante:'),
                    _doubleDisabled('Nombre', Icons.person, 'Apellido', Icons.person),
                    _doubleDisabled('Telefono', Icons.phone, 'Telefono', Icons.phone),
                    _doubleDisabled('Tipo de documento', Icons.badge, 'Numero de documento', Icons.credit_card),
                    _disabledField('Parentesco', Icons.family_restroom),

                    _sectionTitle('Notas:'),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        enabled: false,
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: 'Observaciones...',
                          hintStyle: const TextStyle(color: disabledGray),
                          filled: true,
                          fillColor: const Color(0xFFF0F0F0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          // TODO: Acción continuar
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: brandTeal,
                          padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        child: const Text('Continuar', style: TextStyle(fontSize: 16)),
                      ),
                    ),

                    const SizedBox(height: 36),
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
