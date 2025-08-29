import 'package:flutter/material.dart';

import 'ishihara_test_flow_page.dart'; // <-- ajusta la ruta real si cambia
import 'amsler_grid_page.dart';

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
            // ===== HEADER =====
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

            // ===== TARJETA 1: Ishihara =====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: _TestCard(
                title: 'Test de Ishihara',
                asset: 'assets/test_ishihara.png',
                circleImage: true,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const IshiharaTestFlowPage()),
                  );
                },
              ),
            ),
            const SizedBox(height: 35),

            // ===== TARJETA 2: Amsler =====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: _TestCard(
                title: 'Rejilla de Amsler',
                asset: 'assets/test_amsler.png',
                circleImage: false,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const AmslerGridPage()));
                },
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

// Placeholder para Amsler (borra esto si ya tienes tu página)
class _AmslerPlaceholderPage extends StatelessWidget {
  const _AmslerPlaceholderPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rejilla de Amsler')),
      body: const Center(child: Text('Tu pantalla de Amsler va aquí')),
    );
  }
}
