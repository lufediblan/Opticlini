import 'package:flutter/material.dart';

class ContactLensCleanPage extends StatelessWidget {
  const ContactLensCleanPage({super.key});

  // Colores del proyecto
  static const Color brand = Color(0xFF05738D);   // turquesa
  static const Color headerGray = Color(0xFFEEEEEE);

  // Estilos
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
                      child: Icon(Icons.person, color: brand, size: 49),
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

            // ===== Píldora con back + título =====
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
                        width: 36, height: 36,
                        child: Center(child: Icon(Icons.chevron_left, size: 40, color: brand)),
                      ),
                    ),
                    const Expanded(
                      child: Center(
                        child: Text(
                          'Limpiar mis lentes de contacto',
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

            // Subtítulo de sección
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Center(
                child: Text(
                  'Limpieza diaria para lentes reutilizables',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                ),
              )
            ),

            const SizedBox(height: 35),

            // ===== Pasos (1 por tarjeta, vertical) =====
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: _StepBlock(
                number: 1,
                title: 'Retira el lente con cuidado',
                body:
                'Con las manos limpias, retira suavemente el lente y colócalo en la palma de tu mano.',
              ),
            ),
            const SizedBox(height: 35),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: _StepBlock(
                number: 2,
                title: 'Aplica solución multipropósito',
                body:
                'Vierte unas gotas de solución sobre el lente en tu palma. Usa solo productos recomendados por tu especialista.',
              ),
            ),
            const SizedBox(height: 35),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: _StepBlock(
                number: 3,
                title: 'Frota suavemente',
                body:
                'Con el dedo índice, frota el lente suavemente en movimientos circulares durante 20 segundos por cada lado.',
              ),
            ),
            const SizedBox(height: 35),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: _StepBlock(
                number: 4,
                title: 'Enjuaga con solución fresca',
                body:
                'Enjuaga el lente con solución nueva para eliminar los residuos y depósitos sueltos.',
              ),
            ),
            const SizedBox(height: 35),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: _StepBlock(
                number: 5,
                title: 'Guarda en estuche limpio',
                body:
                'Coloca el lente en un estuche limpio lleno de solución fresca. Deja reposar mínimo 6 horas.',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------- Widgets privados ----------

class _StepBlock extends StatelessWidget {
  const _StepBlock({
    required this.number,
    required this.title,
    required this.body,
  });

  final int number;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(50, 10, 50, 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: const [
          BoxShadow(color: Color(0x1F000000), blurRadius: 18, offset: Offset(0, 10)),
          BoxShadow(color: Color(0x0F000000), blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        children: [
          // Número centrado
          Container(
            width: 38, height: 38,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: ContactLensCleanPage.brand,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              '$number',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 29,
              ),
            ),
          ),
          const SizedBox(height: 10),

          // Título y cuerpo centrados
          Text(title, textAlign: TextAlign.center, style: ContactLensCleanPage.kTitle),
          const SizedBox(height: 20),
          Text(body, textAlign: TextAlign.center, style: ContactLensCleanPage.kBody),
        ],
      ),
    );
  }
}
