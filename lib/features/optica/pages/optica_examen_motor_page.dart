import 'package:flutter/material.dart';
import '../../../core/widgets/custom_page_header.dart';

class OpticaExamenMotorPage extends StatelessWidget {
  const OpticaExamenMotorPage({super.key});
  static const Color brandTeal = Color(0xFF05738D);
  static const Color backgroundGray = Color(0xFFF4F6F9);

  Widget _textField(String hint, {IconData? icon, bool enabled = true}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: TextField(
        enabled: enabled,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: icon != null ? Icon(icon) : null,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
        ),
      ),
    );
  }

  Widget _toggleRow(String label, bool value, ValueChanged<bool> onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Switch(value: value, onChanged: onChanged, activeColor: brandTeal),
      ],
    );
  }

  Widget _sectionCard(String title, List<Widget> content) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [ BoxShadow(color: Color(0x22000000), blurRadius: 10, offset: Offset(0, 5)) ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: const EdgeInsets.symmetric(horizontal: 16), child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
          const SizedBox(height: 8),
          ...content,
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
            const CustomPageHeader(title: 'Examen Motor'),
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
                      _sectionCard('Deducciones (OD / OI)', [
                        _textField('OD (Ojo Derecho)', icon: Icons.remove_red_eye),
                        _textField('OI (Ojo Izquierdo)', icon: Icons.remove_red_eye),
                        _textField('Versiones', icon: Icons.sync),
                      ]),

                      _sectionCard('Cover Test', [
                        Row(
                          children: [
                            Expanded(child: _textField('Visión Lejana', icon: Icons.remove_red_eye)),
                            const SizedBox(width: 8),
                            Expanded(child: _textField('Visión Cercana', icon: Icons.remove_red_eye)),
                          ],
                        ),
                        const SizedBox(height: 8),
                        _textField('Metros'),
                        _textField('Centímetros'),
                      ]),

                      _sectionCard('PPC (Punto de Convergencia Próximo)', [
                        _textField('Método'),
                        _textField('Distancia (m)'),
                        _textField('Observaciones'),
                      ]),

                      _sectionCard('Reflejos (Directo / Consensual / Acomodativo)', [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Ojo Derecho (OD):', style: TextStyle(fontWeight: FontWeight.w600)),
                              _toggleRow('Directo', false, (v) {}),
                              _toggleRow('Consensual', false, (v) {}),
                              _toggleRow('Acomodativo', false, (v) {}),
                              const Divider(height: 24),
                              const Text('Ojo Izquierdo (OI):', style: TextStyle(fontWeight: FontWeight.w600)),
                              _toggleRow('Directo', false, (v) {}),
                              _toggleRow('Consensual', false, (v) {}),
                              _toggleRow('Acomodativo', false, (v) {}),
                            ],
                          ),
                        ),
                      ]),


                      const SizedBox(height: 16),
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
