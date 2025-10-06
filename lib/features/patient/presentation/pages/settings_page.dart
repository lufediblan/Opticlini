import 'package:flutter/material.dart';
import 'patient_home_page.dart';
import 'patient_appointments_page.dart';
import 'patient_tests_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  static const Color brand = Color(0xFF05738D);
  static const Color headerGray = Color(0xFFEEEEEE);

  // helper: ir a Home con el tab deseado
  void _goToHomeTab(BuildContext context, int tabIndex) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => PatientHomePage(initialIndex: tabIndex)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // ======= CUERPO =======
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 24),
          children: [
            // Header igual
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
                children: [
                  // Avatar que también puede volver a settings (opcional)
                  const CircleAvatar(
                    radius: 29,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, color: brand, size: 49),
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text(
                      'Hola Luis!',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                        shadows: [Shadow(color: Color(0x33000000), offset: Offset(0, 1), blurRadius: 2)],
                      ),
                    ),
                  ),
                  Image.asset('assets/logo2.png', height: 82),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Cerrar sesión
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {
                    // Vuelve al login y limpia el stack
                    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                  },
                  child: const Text(
                    'Cerrar Sesion',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 35),
            const _SectionPill(title: 'Proximo examen Visual'),
            const SizedBox(height: 35),
            const _NoteCard(text: 'Fecha de tu proximo control'),

            const SizedBox(height: 35),
            const _SectionPill(title: 'Ultimo examen visual'),
            const SizedBox(height: 35),
            const _NoteCard(text: 'Fecha de tu ultimo examen visual'),
          ],
        ),
      ),

      // ======= MISMA BARRA INFERIOR =======
      bottomNavigationBar: NavigationBar(
        backgroundColor: brand,
        height: 60,
        // seleccionamos Home (0) para que se vea igual al resto
        selectedIndex: 0,
        onDestinationSelected: (i) {
          // Navegar a Home con el tab correspondiente
          _goToHomeTab(context, i);
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined,        size: 25, color: Colors.white), label: ''),
          NavigationDestination(icon: Icon(Icons.calendar_month_outlined,size: 25, color: Colors.white), label: ''),
          NavigationDestination(icon: Icon(Icons.visibility_outlined,  size: 25, color: Colors.white), label: ''),
        ],
      ),
    );
  }
}

// ======= widgets internos (igual que antes) =======

class _SectionPill extends StatelessWidget {
  const _SectionPill({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: const [
            BoxShadow(color: Color(0x29000000), blurRadius: 18, offset: Offset(0, 10)),
            BoxShadow(color: Color(0x10000000), blurRadius: 3, offset: Offset(0, 1)),
          ],
        ),
        child: Center(
          child: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
        ),
      ),
    );
  }
}

class _NoteCard extends StatelessWidget {
  const _NoteCard({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [
            BoxShadow(color: Color(0x29000000), blurRadius: 18, offset: Offset(0, 10)),
            BoxShadow(color: Color(0x10000000), blurRadius: 3, offset: Offset(0, 1)),
          ],
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 15.5, height: 1.28, color: Colors.black87),
        ),
      ),
    );
  }
}
