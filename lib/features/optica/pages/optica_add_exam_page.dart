import 'package:flutter/material.dart';
import '../../../core/widgets/custom_page_header.dart';

class OpticaAddExamPage extends StatelessWidget {
  const OpticaAddExamPage({super.key});

  static const Color brandTeal = Color(0xFF05738D);

  Widget _examTile(String label, String assetPath, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          boxShadow: const [
            BoxShadow(
              color: Color(0x1F000000),
              blurRadius: 12,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(assetPath, height: 40, fit: BoxFit.contain),
            const SizedBox(height: 12),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F9),
      body: SafeArea(
        child: Column(
          children: [
            const CustomPageHeader(title: 'Agregar Examen'),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Column(
                  children: [
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      childAspectRatio: 1.1,
                      children: [
                        _examTile('Datos', 'assets/ic_datos.png', () {}),
                        _examTile('Anamnesis', 'assets/ic_anamnesis.png', () {
                          Navigator.pushNamed(context, '/optica/anamnesis');
                        }),
                        _examTile('Agudeza', 'assets/ic_agudeza.png', () {
                          Navigator.pushNamed(context, '/optica/add_exam/agudeza');
                        }),
                        _examTile('Examen Motor', 'assets/ic_examen_motor.png', () {
                          Navigator.pushNamed(context, '/optica/examen-motor');
                        }),
                        _examTile('Examen Optometrico', 'assets/ic_optometrico.png', () {
                          Navigator.pushNamed(context, '/optica/examen-optometrico');
                        }),
                        _examTile('Dialogo y Conducta', 'assets/ic_dialogo.png', () {
                          Navigator.pushNamed(context, '/dialogo-conducta');
                        }),
                        _examTile('Contactología', 'assets/ic_contactologia.png', () {
                          Navigator.pushNamed(context, '/optica/contactologia');
                        }),
                        _examTile('Medicación e Imágenes', 'assets/ic_medicacion.png', () {
                          Navigator.pushNamed(context, '/optica/medicacion-imagenes');
                        }),
                        _examTile('Pruebas', 'assets/ic_pruebas.png', () {
                          Navigator.pushNamed(context, '/optica/pruebas');
                        }),
                      ],
                    ),

                    const SizedBox(height: 24),

                    const Text(
                      'Nota: Al final del día debe se cerrara la historia clínica, antes de cerrar la historia clínica comprobar si se terminó todo el proceso.',
                      style: TextStyle(fontSize: 13),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 16),

                    ElevatedButton(
                      onPressed: () {
                        // TODO: Acción de cierre
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: brandTeal,
                        padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text(
                        'Cerrar Historia Clínica',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                      ),
                    ),

                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
