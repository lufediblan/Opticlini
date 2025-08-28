import 'package:flutter/material.dart';

// Detalles (ajusta la ruta si están en otra carpeta)
import 'contact_lens_care_page.dart';
import 'glasses_care_page.dart';

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
            // ===== HEADER (igual a tus otras vistas) =====
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
                        shadows: [Shadow(color: Color(0x33000000), offset: Offset(0, 1), blurRadius: 2)],
                      ),
                    ),
                  ),
                  Image.asset('assets/logo2.png', height: 82),
                ],
              ),
            ),

            const SizedBox(height: 56),

            // ===== PÍLDORA =====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
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
                      borderRadius: BorderRadius.circular(20),
                      onTap: () => Navigator.pop(context),
                      child: const SizedBox(
                        width: 36,
                        height: 36,
                        child: Center(
                          child: Icon(Icons.chevron_left, size: 26, color: brand),
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Center(
                        child: Text(
                          'Recomendaciones',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 36,
                      height: 36,
                      child: Center(child: Icon(Icons.auto_awesome, size: 22, color: brand)),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // ===== TARJETAS (2 arriba) =====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Expanded(
                    child: _RecCard(
                      title: 'Cuidar mis lentes\nde contacto',
                      asset: 'assets/lentes_cuidar.png',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const ContactLensCarePage()),
                        );
                        // o por ruta con nombre: Navigator.pushNamed(context, '/recommendations/contact-lens-care');
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _RecCard(
                      title: 'Limpiar mis lentes\nde contacto',
                      asset: 'assets/lentes_limpiar.png',
                      onTap: () {
                        // TODO: Conecta a la vista "Limpiar mis lentes de contacto" cuando la tengas
                        // Navigator.push(context, MaterialPageRoute(builder: (_) => const CleanContactLensPage()));
                      },
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // ===== TARJETA ANCHA =====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: _RecCardWide(
                title: 'Cuidar y limpiar mis gafas',
                asset: 'assets/gafas.png',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const GlassesCarePage()),
                  );
                  // o: Navigator.pushNamed(context, '/recommendations/glasses-care');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Tarjeta cuadrada (dos de arriba)
class _RecCard extends StatelessWidget {
  const _RecCard({
    required this.title,
    required this.asset,
    this.onTap,
  });

  final String title;
  final String asset;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final card = Container(
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
          Image.asset(asset, width: 100, height: 100, fit: BoxFit.contain),
        ],
      ),
    );

    if (onTap == null) return card;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: card,
      ),
    );
  }
}

/// Tarjeta ancha (la de abajo)
class _RecCardWide extends StatelessWidget {
  const _RecCardWide({
    required this.title,
    required this.asset,
    this.onTap,
  });

  final String title;
  final String asset;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final card = Container(
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
          const SizedBox(height: 10),
          Image.asset(asset, width: 130, height: 130, fit: BoxFit.contain),
        ],
      ),
    );

    if (onTap == null) return card;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: card,
      ),
    );
  }
}
