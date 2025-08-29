import 'package:flutter/material.dart';
import '../../../core/widgets/custom_page_header.dart';

class OpticaExamenOptometricoPage extends StatelessWidget {
  const OpticaExamenOptometricoPage({super.key});
  static const Color brandTeal = Color(0xFF05738D);
  static const Color backgroundGray = Color(0xFFF4F6F9);

  Widget _input(String hint, {IconData? icon}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: icon != null ? Icon(icon) : null,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _doubleInput(String label1, IconData icon1, String label2, IconData icon2) {
    return Row(
      children: [
        Expanded(child: _input(label1, icon: icon1)),
        const SizedBox(width: 8),
        Expanded(child: _input(label2, icon: icon2)),
      ],
    );
  }

  Widget _sectionCard(String title, List<Widget> children) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: const EdgeInsets.only(top: 12, bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [ BoxShadow(color: Color(0x22000000), blurRadius: 10, offset: Offset(0, 5)) ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ),
          const SizedBox(height: 8),
          ...children,
        ],
      ),
    );
  }

  Widget _actionButton(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 8),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: brandTeal,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: Text(text, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundGray,
      body: SafeArea(
        child: Column(
          children: [
            const CustomPageHeader(title: 'Examen Optometrico'),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: brandTeal),
              child: const Text('Editar'),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 24),
                child: IconTheme(
                  data: const IconThemeData(color: brandTeal),
                  child: Column(
                    children: [
                      _sectionCard('Keratometria (OD / OI)', [
                        _doubleInput('Esfera', Icons.remove_red_eye, 'Esfera', Icons.remove_red_eye),
                        _doubleInput('Cilindro', Icons.remove_red_eye, 'Cilindro', Icons.remove_red_eye),
                        _doubleInput('Eje', Icons.remove_red_eye, 'Adición', Icons.remove_red_eye),
                        _input('Otros Hallazgos'),
                      ]),

                      _sectionCard('Retinoscopía (OD / OI)', [
                        _doubleInput('OD - Subjetivo', Icons.remove_red_eye, 'OI - Subjetivo', Icons.remove_red_eye),
                      ]),

                      _sectionCard('Fórmula Final (OD / OI)', [
                        _doubleInput('Esfera', Icons.remove_red_eye, 'Esfera', Icons.remove_red_eye),
                        _doubleInput('Cilindro', Icons.remove_red_eye, 'Cilindro', Icons.remove_red_eye),
                        _doubleInput('Eje', Icons.remove_red_eye, 'Adición', Icons.remove_red_eye),
                        _doubleInput('Agudeza', Icons.remove_red_eye, 'Agudeza', Icons.remove_red_eye),
                      ]),

                      _sectionCard('RX Final Cercana (Opcional)', [
                        _doubleInput('Esfera', Icons.remove_red_eye, 'Esfera', Icons.remove_red_eye),
                        _doubleInput('Cilindro', Icons.remove_red_eye, 'Cilindro', Icons.remove_red_eye),
                        _doubleInput('Eje', Icons.remove_red_eye, 'Adición', Icons.remove_red_eye),
                        _doubleInput('Agudeza', Icons.remove_red_eye, 'Agudeza', Icons.remove_red_eye),
                      ]),

                      _sectionCard('Material y Uso', [
                        _doubleInput('Material del Lente', Icons.remove_red_eye, 'Material del Lente', Icons.remove_red_eye),
                        _input('Uso del Lente', icon: Icons.list),
                      ]),

                      _sectionCard('Medidas', [
                        _doubleInput('Distancia Naso-Pupilar', Icons.remove_red_eye, 'Distancia Naso-Pupilar', Icons.remove_red_eye),
                        _input('Distancia Pupilar'),
                        _doubleInput('Altura Focal', Icons.remove_red_eye, 'Altura Focal', Icons.remove_red_eye),
                      ]),

                      const SizedBox(height: 12),
                      _actionButton('Guardar'),
                      _actionButton('Continuar'),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
