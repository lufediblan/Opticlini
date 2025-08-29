import 'package:flutter/material.dart';
import '../../../core/widgets/custom_page_header.dart';

class OpticaAgudezaPage extends StatelessWidget {
  const OpticaAgudezaPage({super.key});
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

  Widget _doubleInput(String hint1, IconData icon1, String hint2, IconData icon2) {
    return Row(
      children: [
        Expanded(child: _input(hint1, icon: icon1)),
        const SizedBox(width: 8),
        Expanded(child: _input(hint2, icon: icon2)),
      ],
    );
  }

  Widget _groupCard(String title, List<Widget> fields) {
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
          ...fields,
        ],
      ),
    );
  }

  Widget _button(String text) {
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
            const CustomPageHeader(title: 'Agudeza'),
            const SizedBox(height: 8),
            ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: brandTeal), child: const Text('Editar')),
            const SizedBox(height: 8),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 24),
                child: IconTheme(
                  data: const IconThemeData(color: brandTeal),
                  child: Column(
                    children: [
                      _groupCard('Corrección Visual', [
                        _input('Corrección Visual', icon: Icons.remove_red_eye),
                        _input('Lentes de Uso', icon: Icons.check),
                        _input('Tipo de consulta', icon: Icons.list),
                        _input('Notas', icon: Icons.note),
                      ]),
                      _groupCard('AV Sin Corrección (OD / OI)', [
                        _input('Visión Lejana', icon: Icons.visibility),
                        _input('Distancia', icon: Icons.straighten),
                      ]),
                      _groupCard('Lenteometría (OD / OI)', [
                        _doubleInput('Esfera', Icons.remove_red_eye, 'Esfera', Icons.remove_red_eye),
                        _doubleInput('Cilindro', Icons.remove_red_eye, 'Cilindro', Icons.remove_red_eye),
                        _doubleInput('Eje', Icons.remove_red_eye, 'Adición', Icons.remove_red_eye),
                        _input('Agudeza Visión Lejana'),
                        _input('Agudeza Visión Cercana'),
                        _input('Notas'),
                      ]),
                      _groupCard('Biomicropía', [
                        _doubleInput('OD', Icons.remove_red_eye, 'OI', Icons.remove_red_eye),
                        _input('Notas'),
                      ]),
                      _groupCard('Fondo de Ojo', [
                        _input(''),
                      ]),
                      _groupCard('Presión Intraocular (OD / OI)', [
                        _doubleInput('mmHg', Icons.album, 'mmHg', Icons.album),
                        _input('Ojo Dominante'),
                      ]),

                      const SizedBox(height: 12),
                      _button('Guardar'),
                      _button('Continuar'),
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
