import 'package:flutter/material.dart';
import 'patient_appointments_page.dart';
import 'patient_tests_page.dart';
import 'recommendations_page.dart';
import 'clinical_history_page.dart';

class PatientHomePage extends StatefulWidget {
  const PatientHomePage({super.key, this.initialIndex = 0});
  final int initialIndex;

  @override
  State<PatientHomePage> createState() => _PatientHomePageState();
}

class _PatientHomePageState extends State<PatientHomePage> {
  static const Color brand = Color(0xFF05738D); // iconos/persona
  static const Color teal  = Color(0xFF05738D); // barra inferior

  int _index = 0;

  final _pages = const [
    _HomeView(),
    PatientAppointmentsPage(),
    PatientTestsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_index],
      bottomNavigationBar: NavigationBar(
        backgroundColor: teal,
        height: 60,
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined,size:25, color: Colors.white), label: ''),
          NavigationDestination(icon: Icon(Icons.calendar_month_outlined,size:25, color: Colors.white), label: ''),
          NavigationDestination(icon: Icon(Icons.visibility_outlined,size:25, color: Colors.white), label: ''),
        ],
      ),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 28),
        children: [
          const _TopStrip(),
          const SizedBox(height: 52),

          // RECOMENDACIONES
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: _FeatureCard(
              icon: Icons.auto_awesome,
              title: 'Recomendaciones',
              subtitle: 'Habitos y cuidados de las gafas y lentes de contacto.',
              minHeight: 110,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const RecommendationsPage()),
                );
              },
            ),
          ),
          const SizedBox(height: 35),

          // HISTORIA CLÍNICA
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: _FeatureCard(
              icon: Icons.assignment,
              title: 'Historia Clinica',
              subtitle: 'Pide la copia de tu historia clínica',
              minHeight: 110,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ClinicalHistoryPage()),
                );
              },
            ),
          ),
          // ⬆️ Se eliminó la tarjeta de "Catálogo"
        ],
      ),
    );
  }
}

class _TopStrip extends StatelessWidget {
  const _TopStrip();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 136,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFEEEEEE),
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
        boxShadow: const [
          BoxShadow(color: Color(0x22000000), blurRadius: 12, offset: Offset(0, 6)),
        ],
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/settings'),
            child: const CircleAvatar(
              radius: 29,
              backgroundColor: Colors.white,
              child: Icon(Icons.person, color: Color(0xFF05738D), size: 49),
            ),
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
          Image(image: const AssetImage('assets/logo2.png'), height: 82),
        ],
      ),

    );
  }
}

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final double? minHeight;
  final VoidCallback? onTap;

  const _FeatureCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.minHeight,
    this.onTap,
  });

  static const _title = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w800,
    color: Colors.black,
    shadows: [Shadow(color: Color(0x33000000), offset: Offset(0, 1), blurRadius: 2)],
  );

  static const _subtitle = TextStyle(
    fontSize: 17,
    height: 1.25,
    color: Colors.black87,
    shadows: [Shadow(color: Color(0x1A000000), offset: Offset(0, 1), blurRadius: 1.5)],
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: minHeight ?? 40),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: const [
          BoxShadow(
            color: Color(0x29000000),
            blurRadius: 18,
            spreadRadius: 1,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(22),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18, 16, 18, 18),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 2),
                Icon(icon, size: 28, color: const Color(0xFF05738D)),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, maxLines: 1, overflow: TextOverflow.ellipsis, style: _title),
                      const SizedBox(height: 8),
                      Text(subtitle, style: _subtitle),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
