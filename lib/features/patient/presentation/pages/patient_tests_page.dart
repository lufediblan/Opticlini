import 'package:flutter/material.dart';

class PatientTestsPage extends StatelessWidget {
  const PatientTestsPage({super.key});

  static const Color brand = Color(0xFF05738D);
  static const Color headerGray = Color(0xFFEEEEEE);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 24),
          children: [
            // ===== HEADER (igual a otras pantallas) =====
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
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Colors.black),
                    ),
                  ),
                  Image.asset('assets/logo2.png', height: 82),
                ],
              ),
            ),

            const SizedBox(height: 56),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'Test de Vision',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900, letterSpacing: .2),
              ),
            ),
            const SizedBox(height: 35),

            // ===== TARJETA 1 envuelta con Padding lateral configurable =====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24), // <-- cambia este valor cuando quieras
              child: const _TestCard(
                title: 'Test de Ishihara',
                asset: 'assets/test_ishihara.png',
                circleImage: true,
              ),
            ),
            const SizedBox(height: 35),

            // ===== TARJETA 2 envuelta con Padding lateral configurable =====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24), // <-- y este también
              child: const _TestCard(
                title: 'Rejilla de Amsler',
                asset: 'assets/test_amsler.png',
                circleImage: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TestCard extends StatelessWidget {
  const _TestCard({
    required this.title,
    required this.asset,
    this.circleImage = false,
    this.onTap,
  });

  final String title;
  final String asset;
  final bool circleImage;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final card = Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(color: Color(0x1F000000), blurRadius: 18, offset: Offset(0, 10)),
          BoxShadow(color: Color(0x0F000000), blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title, textAlign: TextAlign.center, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
          const SizedBox(height: 12),
          if (circleImage)
            ClipOval(
              child: Image.asset(asset, width: 112, height: 112, fit: BoxFit.cover),
            )
          else
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(asset, width: 130, height: 120, fit: BoxFit.cover),
            ),
        ],
      ),
    );

    return onTap == null
        ? card
        : InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: onTap,
      child: card,
    );
  }
}
