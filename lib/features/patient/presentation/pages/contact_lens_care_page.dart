import 'package:flutter/material.dart';

class ContactLensCarePage extends StatelessWidget {
  const ContactLensCarePage({super.key});

  // Colores del proyecto
  static const Color brand = Color(0xFF05738D);
  static const Color headerGray = Color(0xFFEEEEEE);

  // Estilos reutilizados
  static const TextStyle kTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w800,
    color: Colors.black,
    shadows: [Shadow(color: Color(0x33000000), offset: Offset(0, 1), blurRadius: 2)],
  );

  static const TextStyle kBody = TextStyle(
    fontSize: 15.5,
    height: 1.28,
    color: Colors.black87,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 24),
          children: [
            // ===== Header (igual a otras vistas) =====
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
                  child: Icon(Icons.person, color:brand, size: 49),
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

            // ===== Píldora (misma que Recomendaciones) =====
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
                    // back
                    InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () => Navigator.pop(context),
                      child: const SizedBox(
                        width: 36,
                        height: 36,
                        child: Center(
                          child: Icon(Icons.chevron_left, size: 40, color: brand),
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Center(
                        child: Text(
                          'Cuidar mis lentes de contacto',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 35),

            // ===== Tarjeta 1: Lávate las manos =====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: _InfoCard(
                leading: _PngIcon('assets/ic_hands.png'),
                title: 'Lávate las manos siempre',
                body:
                'Antes de tocar tus lentes, lava tus manos con jabón antibacterial y sécalas '
                    'con una toalla limpia sin pelusa.',
              ),
            ),

            const SizedBox(height: 35),

            // ===== Tarjeta 2: Respeta los tiempos (reloj PNG) =====
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: _InfoCard(
                leading: _PngIcon('assets/ic_clock.png'),
                title: 'Respeta los tiempos de uso',
                body:
                'No excedas el tiempo recomendado: diarios (1 día), semanales (7 días), '
                    'mensuales (30 días). Marca las fechas en tu calendario.',
              ),
            ),

            const SizedBox(height: 35),

            // ===== Tarjeta 3: Solución estéril =====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: _InfoCard(
                leading: _PngIcon('assets/ic_drops.png'),
                title: 'Usa solo solución estéril',
                body:
                'Nunca uses agua del grifo, saliva o soluciones caseras. Solo utiliza '
                    'productos específicos para lentes de contacto.',
              ),
            ),

            const SizedBox(height: 35),

            // ===== Tarjeta 4: Cambia el estuche (peligro PNG) =====
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: _InfoCard(
                leading: _PngIcon('assets/ic_warning.png'),
                title: 'Cambia el estuche regularmente',
                body:
                'Reemplaza tu estuche cada 3 meses y enjuágalo diariamente con solución fresca, '
                    'nunca con agua.',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Icono PNG con tamaño consistente
class _PngIcon extends StatelessWidget {
  const _PngIcon(this.asset, {this.size = 80});
  final String asset;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Image.asset(asset, width: size, height: size, fit: BoxFit.contain);
  }
}

/// Tarjeta genérica de recomendación
class _InfoCard extends StatelessWidget {
  const _InfoCard({
    required this.leading,
    required this.title,
    required this.body,
  });

  final Widget leading;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: const [
          BoxShadow(color: Color(0x1F000000), blurRadius: 18, offset: Offset(0, 10)),
          BoxShadow(color: Color(0x0F000000), blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 56,
            child: Center(child: leading),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: ContactLensCarePage.kTitle),
                const SizedBox(height: 6),
                Text(body, style: ContactLensCarePage.kBody),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
