import 'package:flutter/material.dart';

class IshiharaTestFlowPage extends StatefulWidget {
  const IshiharaTestFlowPage({super.key});

  @override
  State<IshiharaTestFlowPage> createState() => _IshiharaTestFlowPageState();
}

class _IshiharaTestFlowPageState extends State<IshiharaTestFlowPage> {
  static const Color brand = Color(0xFF05738D);
  static const Color headerGray = Color(0xFFEEEEEE);

  // Las imágenes están en: assets/
  // Aquí usamos el nombre EXACTO del archivo (con .png).
  final List<_Plate> _plates = [
    _Plate(image: '12.png', options: ['12', 'No veo nada'], correct: '12'),
    _Plate(image: '8.png',  options: ['8', '3', 'No veo nada'], correct: '8'),
    _Plate(image: '6.png',  options: ['6', '5', 'No veo nada'], correct: '6'),
    _Plate(image: '5.png',  options: ['5', 'No veo nada'], correct: '5'),
    _Plate(image: '3.png',  options: ['3', 'No veo nada'], correct: '3'),
    _Plate(image: '15.png', options: ['15', '17', 'No veo nada'], correct: '15'),
    _Plate(image: '74.png', options: ['74', '21', 'No veo nada'], correct: '74'),
    _Plate(image: '2.png',  options: ['2',  'No veo nada'], correct: '2'),
    _Plate(image: '6.png',  options: ['6', 'No veo nada'], correct: '6'),
    _Plate(image: '7.png',  options: ['7',  'No veo nada'], correct: '7'),
    _Plate(image: '97.png', options: ['97', 'No veo nada'], correct: '97'),
    _Plate(image: '45.png', options: ['45', 'No veo nada'], correct: '45'),
    _Plate(image: '16.png', options: ['16', 'No veo nada'], correct: '16'),
    _Plate(image: '73.png', options: ['73', 'No veo nada'], correct: '73'),
    _Plate(
      image: '26.png',
      options: ['26', '6', '66', '2', 'No veo nada'],
      correct: '26',
    ),
  ];

  int _index = 0;
  int _score = 0;

  void _select(String option) {
    final current = _plates[_index];
    if (option == current.correct) _score++;

    if (_index < _plates.length - 1) {
      setState(() => _index++);
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => _IshiharaResultPage(score: _score, total: _plates.length),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final plate = _plates[_index];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 24),
          children: [
            // Header
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

            const SizedBox(height: 18),

            // Píldora título
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.chevron_left, color: brand, size: 30),
                    onPressed: () => Navigator.pop(context),
                  ),
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
                      child: const Center(
                        child: Text('Test de Ishihara', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                ],
              ),
            ),

            const SizedBox(height: 18),

            // Imagen de la placa — usa directamente assets/<archivo>.png
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Center(
                child: Image.asset(
                  'assets/${plate.image}', // <- cambio clave
                  width: 260,
                  height: 260,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Botones de respuesta
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: _OptionsGrid(options: plate.options, onTap: _select),
            ),
          ],
        ),
      ),
    );
  }
}

// ====== RESULT PAGE ======

class _IshiharaResultPage extends StatelessWidget {
  const _IshiharaResultPage({required this.score, required this.total});

  final int score;
  final int total;

  static const Color brand = Color(0xFF05738D);
  static const Color headerGray = Color(0xFFEEEEEE);

  String get _message {
    final percent = score / total;
    if (percent >= 0.8) {
      return 'Resultado normal. No se detectan indicios de discromatopsia.';
    } else if (percent >= 0.5) {
      return 'Posibles dificultades cromáticas leves. Considera una evaluación completa.';
    } else {
      return 'Presenta deficiencias visuales cromáticas. Pide una cita para la revisión completa.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 24),
          children: [
            // Header
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

            const SizedBox(height: 24),

            // Imagen final
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Center(
                child: Image.asset(
                  'assets/97.png', // <- cambio clave
                  width: 260,
                  height: 260,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Píldora
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: const [
                    BoxShadow(color: Color(0x29000000), blurRadius: 18, offset: Offset(0, 10)),
                    BoxShadow(color: Color(0x10000000), blurRadius: 3, offset: Offset(0, 1)),
                  ],
                ),
                child: const Center(
                  child: Text('Test de Ishihara', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Mensaje
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: const [
                    BoxShadow(color: Color(0x29000000), blurRadius: 18, offset: Offset(0, 10)),
                    BoxShadow(color: Color(0x10000000), blurRadius: 3, offset: Offset(0, 1)),
                  ],
                ),
                child: Text(_message, textAlign: TextAlign.center, style: const TextStyle(fontSize: 16.5, height: 1.35)),
              ),
            ),

            const SizedBox(height: 20),

            // Botón regresar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: brand,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    textStyle: const TextStyle(fontWeight: FontWeight.w800),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Regresar'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ====== helpers ======

class _Plate {
  final String image;         // nombre del archivo con extensión, ej: '12.png'
  final List<String> options;
  final String correct;
  const _Plate({required this.image, required this.options, required this.correct});
}

class _OptionsGrid extends StatelessWidget {
  const _OptionsGrid({required this.options, required this.onTap});
  final List<String> options;
  final ValueChanged<String> onTap;

  @override
  Widget build(BuildContext context) {
    List<Row> rows = [];
    for (int i = 0; i < options.length; i += 2) {
      final slice = options.sublist(i, (i + 2).clamp(0, options.length));
      rows.add(
        Row(
          children: [
            Expanded(child: _AnswerButton(text: slice[0], onTap: () => onTap(slice[0]))),
            if (slice.length == 2) const SizedBox(width: 16),
            if (slice.length == 2) Expanded(child: _AnswerButton(text: slice[1], onTap: () => onTap(slice[1]))),
          ],
        ),
      );
      if (i + 2 < options.length) rows.add(const Row(children: [SizedBox(height: 14)]));
    }
    return Column(children: rows);
  }
}

class _AnswerButton extends StatelessWidget {
  const _AnswerButton({required this.text, required this.onTap});
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFFEEEEEE),
      borderRadius: BorderRadius.circular(12),
      elevation: 3,
      shadowColor: const Color(0x33000000),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          height: 46,
          alignment: Alignment.center,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          child: Text(text, style: const TextStyle(fontWeight: FontWeight.w800)),
        ),
      ),
    );
  }
}
