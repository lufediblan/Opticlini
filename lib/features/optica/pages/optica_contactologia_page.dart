import 'package:flutter/material.dart';
import '../../../core/widgets/custom_page_header.dart';

class OpticaContactologiaPage extends StatelessWidget {
  const OpticaContactologiaPage({super.key});

  static const Color brandTeal = Color(0xFF05738D);
  static const Color backgroundGray = Color(0xFFF4F6F9);

  Widget _input(String hint, {IconData? icon, bool readOnly = false}) {
    return TextField(
      readOnly: readOnly,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: icon != null ? Icon(icon, color: brandTeal) : null,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _gridRow(String leftHint, String rightHint, {IconData? leftIcon, IconData? rightIcon}) {
    return Row(
      children: [
        Expanded(child: _input(leftHint, icon: leftIcon)),
        const SizedBox(width: 8),
        Expanded(child: _input(rightHint, icon: rightIcon)),
      ],
    );
  }

  Widget _sectionCard(String title, List<Widget> children) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [BoxShadow(color: Color(0x1A000000), blurRadius: 12, offset: Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
          const SizedBox(height: 12),
          ...children,
        ],
      ),
    );
  }

  Widget _bottomButton(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 8),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: brandTeal,
          minimumSize: const Size.fromHeight(48),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundGray,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CustomPageHeader(title: 'Contactología'),
            const SizedBox(height: 12),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: brandTeal),
                child: const Text('Editar'),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 40),
                child: Column(
                  children: [
                    _sectionCard('Prueba', [
                      _gridRow('Fecha', 'Tipo'),
                      const SizedBox(height: 8),
                      _gridRow('Ojo', 'Curva Base'),
                      const SizedBox(height: 8),
                      _gridRow('Poder', 'Diámetro'),
                      const SizedBox(height: 8),
                      _gridRow('Sobre‑ref.','Eje'),
                      const SizedBox(height: 8),
                      _gridRow('AV', 'Resultado'),
                    ]),
                    _sectionCard('Fórmula Final', [
                      _gridRow('Lente formulado OD', 'Lente formulado OI'),
                      const SizedBox(height: 8),
                      _gridRow('Esfera OD', 'Esfera OI', leftIcon: Icons.remove_red_eye, rightIcon: Icons.remove_red_eye),
                      const SizedBox(height: 8),
                      _gridRow('Cilindro OD', 'Cilindro OI', leftIcon: Icons.casino, rightIcon: Icons.casino),
                      const SizedBox(height: 8),
                      _gridRow('Eje OD', 'Curva Base', leftIcon: Icons.add, rightIcon: Icons.add),
                      const SizedBox(height: 8),
                      _gridRow('Diámetro OD', 'Diámetro OI'),
                    ]),
                    const SizedBox(height: 24),
                    _bottomButton('Guardar'),
                    _bottomButton('Continuar'),
                    const SizedBox(height: 24),
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
