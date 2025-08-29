import 'package:flutter/material.dart';

class AmslerGridPage extends StatelessWidget {
  const AmslerGridPage({super.key});

  // Colores del proyecto
  static const Color brand = Color(0xFF05738D);
  static const Color headerGray = Color(0xFFEEEEEE);
  static const Color hintGray = Color(0xFF9E9E9E);

  static const TextStyle kTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w800,
    color: Colors.black,
    shadows: [Shadow(color: Color(0x33000000), offset: Offset(0, 1), blurRadius: 2)],
  );

  static const TextStyle kBody = TextStyle(fontSize: 15.5, height: 1.32, color: Colors.black87);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 28),
          children: [
            // ===== Header (igual a otras pantallas) =====
            Container(
              height: 136,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: headerGray,
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
                boxShadow: const [BoxShadow(color: Color(0x22000000), blurRadius: 12, offset: Offset(0, 6))],
              ),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/settings'),
                child: const CircleAvatar(
                  radius: 29,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, color: AmslerGridPage.brand, size: 49),
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
                        child: Text('Rejilla de Amsler', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 35),

            // ===== Instrucciones =====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: const [
                    BoxShadow(color: Color(0x1F000000), blurRadius: 18, offset: Offset(0, 10)),
                    BoxShadow(color: Color(0x0F000000), blurRadius: 4, offset: Offset(0, 2)),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SizedBox(height: 10),
                    _Bullet('Haga la prueba bajo iluminación normal, en una habitación en la que suela leer.'),
                    _Bullet('Póngase las gafas que normalmente lleva para leer (incluso si solo usa gafas de lectura compradas en una tienda).'),
                    _Bullet('Sostenga la rejilla de Amsler a unos 35–40 centímetros de sus ojos.'),
                    _Bullet('Realice la prueba de cada ojo por separado: cubra el ojo izquierdo con la mano y mire la rejilla únicamente con el ojo derecho. Luego repita con el otro ojo.'),
                    _Bullet('Mantenga su ojo enfocado en el punto central de la rejilla y responda:'),
                    _SubBullets([
                      '¿Alguna de las líneas de la rejilla se ve ondulada, borrosa o distorsionada?',
                      '¿Ve zonas oscuras o en blanco en la rejilla?',
                      '¿Hay “agujeros” (áreas faltantes) o áreas oscuras en la rejilla?',
                      '¿Puede ver todas las esquinas y lados de la rejilla (manteniendo el ojo enfocado en el punto central)?',
                    ]),
                    SizedBox(height: 6),
                    Text('Ahora haga lo mismo con el otro ojo.', style: kBody),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 18),

            // ===== Rejilla (imagen) =====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/test_amsler.png', // tu imagen de rejilla
                  height: 380,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 18),

            // ===== Importante =====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(color: Color(0x29000000), blurRadius: 18, offset: Offset(0, 10)),
                    BoxShadow(color: Color(0x10000000), blurRadius: 3, offset: Offset(0, 1)),
                  ],
                ),
                child: const Text(
                  'IMPORTANTE: Informe a su profesional del cuidado ocular sobre cualquier irregularidad de forma inmediata',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w800),
                ),
              ),
            ),

            const SizedBox(height: 14),

            // ===== Observaciones =====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TextField(
                maxLines: 6,
                minLines: 5,
                decoration: InputDecoration(
                  hintText: 'Observaciones:',
                  hintStyle: const TextStyle(color: hintGray, fontWeight: FontWeight.w600),
                  prefixIcon: const Icon(Icons.search, color: hintGray),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: brand, width: 1.4),
                  ),
                ),
                style: kBody,
              ),
            ),

            const SizedBox(height: 10),

            // Nota
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Nota: Se le enviará el informe al profesional; pero si nota alguna irregularidad pida una cita para ser revisado.',
                style: TextStyle(fontSize: 13.5, height: 1.3),
              ),
            ),

            const SizedBox(height: 14),

            // Botón Enviar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                height: 46,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: brand,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    textStyle: const TextStyle(fontWeight: FontWeight.w800),
                  ),
                  onPressed: () {
                    // TODO: manejar envío
                  },
                  child: const Text('Enviar'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------- Widgets auxiliares ----------

class _Bullet extends StatelessWidget {
  const _Bullet(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: AmslerGridPage.kBody),
          Expanded(child: Text(text, style: AmslerGridPage.kBody)),
        ],
      ),
    );
  }
}

class _SubBullets extends StatelessWidget {
  const _SubBullets(this.items);
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, bottom: 4),
      child: Column(
        children: items
            .map((t) => Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('– ', style: AmslerGridPage.kBody),
              Expanded(child: Text(t, style: AmslerGridPage.kBody)),
            ],
          ),
        ))
            .toList(),
      ),
    );
  }
}
