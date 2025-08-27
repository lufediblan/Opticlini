import 'package:flutter/material.dart';

class RecommendationsPage extends StatelessWidget {
  const RecommendationsPage({super.key});

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
            // ===== HEADER (igual a las demás pantallas) =====
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
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Image.asset('assets/logo2.png', height: 82),
                ],
              ),
            ),

            const SizedBox(height: 52),

            // ===== PÍLDORA (con padding lateral 24) =====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: const [
                          BoxShadow(color: Color(0x29000000), blurRadius: 18, offset: Offset(0, 10)),
                          BoxShadow(color: Color(0x10000000), blurRadius: 3, offset: Offset(0, 1)),
                        ],
                      ),
                      child: Row(
                        children: [
                          InkWell(
                            borderRadius: BorderRadius.circular(24),
                            onTap: () => Navigator.pop(context),
                            child: const Padding(
                              padding: EdgeInsets.only(right: 8),
                              child: Icon(Icons.chevron_left, size: 38, color: brand),
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Expanded(
                            child: Text(
                              'Recomendaciones',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                            ),
                          ),
                          const Icon(Icons.auto_awesome, size: 24, color: brand), // ⭐
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 35),

            // ===== TARJETAS (2 arriba con padding externo por lado) =====
            Row(
              children: const [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 24), // margen exterior izquierdo
                    child: _RecCard(
                      title: 'Cuidar mis lentes\nde contacto',
                      asset: 'assets/lentes_cuidar.png',
                    ),
                  ),
                ),
                SizedBox(width: 16), // separación entre tarjetas
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 24), // margen exterior derecho
                    child: _RecCard(
                      title: 'Limpiar mis lentes\nde contacto',
                      asset: 'assets/lentes_limpiar.png',
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 35),

            // ===== TARJETA ANCHA (con padding lateral simétrico) =====
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: _RecCardWide(
                title: 'Cuidar y limpiar mis gafas',
                asset: 'assets/gafas.png',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Tarjeta cuadrada (para las dos de arriba)
class _RecCard extends StatelessWidget {
  const _RecCard({required this.title, required this.asset});

  final String title;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(color: Color(0x1F000000), blurRadius: 18, offset: Offset(0, 10)),
          BoxShadow(color: Color(0x0F000000), blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16.5, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 12),
          Image.asset(asset, width: 92, height: 92, fit: BoxFit.contain),
        ],
      ),
    );
  }
}

/// Tarjeta ancha (para la de gafas)
class _RecCardWide extends StatelessWidget {
  const _RecCardWide({required this.title, required this.asset});

  final String title;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(color: Color(0x1F000000), blurRadius: 18, offset: Offset(0, 10)),
          BoxShadow(color: Color(0x0F000000), blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16.5, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 12),
          Image.asset(asset, width: 120, height: 120, fit: BoxFit.contain),
        ],
      ),
    );
  }
}
