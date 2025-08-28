import 'package:flutter/material.dart';

class GlassesCarePage extends StatelessWidget {
  const GlassesCarePage({super.key});

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
                    radius: 29,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, color: brand, size: 49),
                  ),
                  SizedBox(width: 10),
                  Expanded(
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
                  Image(image: AssetImage('assets/logo2.png'), height: 82),
                ],
              ),
            ),

            const SizedBox(height: 56),

            // ===== Píldora (igual a Recomendaciones) =====
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
                    // Botón back (tap)
                    InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () => Navigator.pop(context),
                      child: const SizedBox(
                        width: 26,
                        height: 36,
                        child: Center(
                          child: Icon(Icons.chevron_left, size: 40, color: brand),
                        ),
                      ),
                    ),
                    // Título centrado
                    const Expanded(
                      child: Center(
                        child: Text(
                          'Cuidar y limpiar mis gafas',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    // Estrellitas a la derecha (mismo ancho que el back)

                  ],
                ),
              ),
            ),

            const SizedBox(height: 35),

            // ===== Tarjeta: Evita estos errores =====
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: _InfoCard(
                assetIcon: 'assets/peligro.png',
                title: 'Evita estos errores',
                bullets: [
                  'No las dejes sobre superficies duras boca abajo',
                  'Evita limpiarlas con la ropa o papel',
                  'No las expongas a temperaturas extremas',
                  'No uses productos químicos agresivos',
                ],
              ),
            ),

            const SizedBox(height: 35),

            // ===== Tarjeta: Mantenimiento regular =====
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: _InfoCard(
                assetIcon: 'assets/reloj1.png',
                title: 'Mantenimiento regular',
                bullets: [
                  'Revisa los tornillos mensualmente y ajústalos si es necesario.',
                  'Visita a tu óptico cada 6 meses para un mantenimiento profesional.',
                ],
              ),
            ),

            const SizedBox(height: 35),

            // ===== Subtítulo sección =====
            const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text('limpiar mis gafas', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
              ),
            ),

            const SizedBox(height: 35),

            // ===== 4 Pasos (2 columnas) =====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1.45,
                children: const [
                  _StepCard(
                    number: 1,
                    text: 'Pasa las gafas bajo un chorro suave de agua tibia para quitar polvo.',
                  ),
                  _StepCard(
                    number: 2,
                    text: 'Usa una gota pequeña de jabón neutro en cada cristal.',
                  ),
                  _StepCard(
                    number: 3,
                    text: 'Elimina todo el jabón con agua tibia.',
                  ),
                  _StepCard(
                    number: 4,
                    text: 'Usa movimientos circulares muy suaves desde el centro.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ======= Widgets privados =======

class _InfoCard extends StatelessWidget {
  const _InfoCard({
    required this.assetIcon,
    required this.title,
    required this.bullets,
  });

  final String assetIcon;
  final String title;
  final List<String> bullets;

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
          // Columna fija para el icono
          SizedBox(
            width: 80,
            child: Center(
              child: Image.asset(
                assetIcon,
                width: 100,
                height: 100,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(width: 10),

          // Contenido
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: GlassesCarePage.kTitle),
                const SizedBox(height: 8),
                ...bullets.map((b) => _BulletLine(text: b)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BulletLine extends StatelessWidget {
  const _BulletLine({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 2),
            child: Text('•', style: GlassesCarePage.kBody),
          ),
          const SizedBox(width: 6),
          Expanded(child: Text(text, style: GlassesCarePage.kBody)),
        ],
      ),
    );
  }
}

class _StepCard extends StatelessWidget {
  const _StepCard({required this.number, required this.text});
  final int number;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 14, 12, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(color: Color(0x1F000000), blurRadius: 18, offset: Offset(0, 10)),
          BoxShadow(color: Color(0x0F000000), blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        children: [
          // Número centrado arriba
          Container(
            width: 28,
            height: 28,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: GlassesCarePage.brand,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Text(
              '$number',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: GlassesCarePage.kBody,
            ),
          ),
        ],
      ),
    );
  }
}
