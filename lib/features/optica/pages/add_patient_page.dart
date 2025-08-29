import 'package:flutter/material.dart';

class AddPatientPage extends StatelessWidget {
  const AddPatientPage({super.key});

  // Colores base
  static const Color brand = Color(0xFF05738D);
  static const Color headerGray = Color(0xFFEEEEEE);
  static const Color hintGray = Color(0xFF9E9E9E);

  // Estilos
  static const TextStyle kH1 = TextStyle(
    fontSize: 18, fontWeight: FontWeight.w800, color: Colors.black,
    shadows: [Shadow(color: Color(0x33000000), offset: Offset(0, 1), blurRadius: 2)],
  );

  static const TextStyle kLabel = TextStyle(
    fontSize: 14.5, fontWeight: FontWeight.w800, color: Colors.black,
  );

  static const EdgeInsets kScreenHPadding = EdgeInsets.symmetric(horizontal: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(bottom: 28),
          children: [
            // ===== Header =====
            Container(
              height: 136,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: headerGray,
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
                boxShadow: const [
                  BoxShadow(color: Color(0x22000000), blurRadius: 12, offset: Offset(0, 6)),
                ],
              ),
              child: Row(
                children: const [
                  CircleAvatar(
                    radius: 29, backgroundColor: Colors.white,
                    child: Icon(Icons.person, color: brand, size: 49),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text('Hola Opticlini!',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w800, color: Colors.black,
                          shadows: [Shadow(color: Color(0x33000000), offset: Offset(0, 1), blurRadius: 2)],
                        )),
                  ),
                  Image(image: AssetImage('assets/logo2.png'), height: 82),
                ],
              ),
            ),

            const SizedBox(height: 18),

            // ===== Píldora vuelta + título =====
            Padding(
              padding: kScreenHPadding,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: const [
                    BoxShadow(color: Color(0x29000000), blurRadius: 18, offset: Offset(0, 10)),
                    BoxShadow(color: Color(0x10000000), blurRadius: 3,  offset: Offset(0, 1)),
                  ],
                ),
                child: Row(
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(24),
                      onTap: () => Navigator.pop(context),
                      child: const SizedBox(
                        width: 36, height: 36,
                        child: Center(child: Icon(Icons.chevron_left, size: 38, color: brand)),
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Text('Agregar datos del paciente', style: kH1),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 10),

            // ======= IDENTIFICACIÓN =======
            _SectionCard(
              title: 'Identificación:',
              children: [
                _Row2(
                  _Input(hint: 'Tipo de documento', icon: Icons.menu_rounded),
                  _Input(hint: 'Numero de documento', icon: Icons.tag_rounded),
                ),
                _Row2(
                  _Input(hint: 'Nombre', icon: Icons.person_outline),
                  _Input(hint: 'Segundo Nombre', icon: Icons.person_outline),
                ),
                _Row2(
                  _Input(hint: 'Apellido', icon: Icons.person_outline),
                  _Input(hint: 'Segundo Apellido', icon: Icons.person_outline),
                ),
                _Row2(
                  _Input(hint: 'Fecha de nacimiento', icon: Icons.calendar_month_outlined),
                  _Input(hint: 'Edad', icon: Icons.cake_outlined),
                ),
                _Row2(
                  _Input(hint: 'Sexo', icon: Icons.wc_outlined),
                  _Input(hint: 'RH', icon: Icons.bloodtype_outlined),
                ),
                _Row2(
                  _Input(hint: 'Estado de la Historia', icon: Icons.fact_check_outlined),
                  const SizedBox.shrink(),
                ),
              ],
            ),

            // ======= CONTACTO =======
            _SectionCard(
              title: 'Contacto:',
              children: [
                _Row2(
                  _Input(hint: 'Direccion', icon: Icons.place_outlined),
                  _Input(hint: 'Barrio', icon: Icons.map_outlined),
                ),
                _Row2(
                  _Input(hint: 'Telefono', icon: Icons.phone_outlined),
                  _Input(hint: 'Telefono', icon: Icons.phone_outlined),
                ),
                _Row2(
                  _Input(hint: 'Correo', icon: Icons.mail_outline),
                  const SizedBox.shrink(),
                ),
                _Row2(
                  _Input(hint: 'Estado civil', icon: Icons.family_restroom_outlined),
                  _Input(hint: 'Ocupacion', icon: Icons.badge_outlined),
                ),
              ],
            ),

            // ======= AFILIACIÓN Y USUARIO =======
            _SectionCard(
              title: 'Afiliacion y usuario:',
              children: [
                _Row2(
                  _Input(hint: 'EPS', icon: Icons.local_hospital_outlined),
                  const SizedBox.shrink(),
                ),
                _Row2(
                  _Input(hint: 'Pais', icon: Icons.flag_outlined),
                  _Input(hint: 'Departamento', icon: Icons.location_city_outlined),
                ),
                _Row2(
                  _Input(hint: 'Tipo de usuario', icon: Icons.verified_user_outlined),
                  _Input(hint: 'Tipo de Afiliacion', icon: Icons.how_to_reg_outlined),
                ),
              ],
            ),

            // ======= RESPONSABLE / ACOMPAÑANTE =======
            _SectionCard(
              title: 'Responsable / Acompañante',
              children: [
                _Row2(
                  _Input(hint: 'Nombre', icon: Icons.person_outline),
                  _Input(hint: 'Apellido', icon: Icons.person_outline),
                ),
                _Row2(
                  _Input(hint: 'Telefono', icon: Icons.phone_outlined),
                  _Input(hint: 'Telefono', icon: Icons.phone_outlined),
                ),
                _Row2(
                  _Input(hint: 'Tipo de documento', icon: Icons.menu_rounded),
                  _Input(hint: 'Numero de documento', icon: Icons.tag_rounded),
                ),
                _Row2(
                  _Input(hint: 'Parentesco', icon: Icons.groups_2_outlined),
                  const SizedBox.shrink(),
                ),
              ],
            ),

            // ===== BOTÓN =====
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
              child: SizedBox(
                height: 46,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: brand, foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    textStyle: const TextStyle(fontWeight: FontWeight.w800),
                  ),
                  onPressed: () {},
                  child: const Text('Agregar paciente'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* ====================  Helpers / Widgets  ==================== */

class _SectionCard extends StatelessWidget {
  const _SectionCard({required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
      child: Container(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(color: Color(0x22000000), blurRadius: 14, offset: Offset(0, 8)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AddPatientPage.kLabel),
            const SizedBox(height: 10),
            ...children,
          ],
        ),
      ),
    );
  }
}

/// Dos campos en una fila (50/50) con separación
class _Row2 extends StatelessWidget {
  const _Row2(this.left, this.right);

  final Widget left;
  final Widget right;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(child: left),
          const SizedBox(width: 10),
          Expanded(child: right),
        ],
      ),
    );
  }
}

/// Campo de texto con ícono y estilo unificado
class _Input extends StatelessWidget {
  const _Input({required this.hint, required this.icon, this.keyboardType});

  final String hint;
  final IconData icon;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
        isDense: true,
        hintText: hint,
        prefixIcon: Icon(icon, size: 22, color: AddPatientPage.brand),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AddPatientPage.brand, width: 1.4),
        ),
        hintStyle: const TextStyle(color: AddPatientPage.hintGray, fontWeight: FontWeight.w700),
      ),
      style: const TextStyle(fontSize: 15.5),
    );
  }
}
