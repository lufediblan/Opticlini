import 'package:flutter/material.dart';
import '../../../core/widgets/custom_page_header.dart';

class OpticaDialogoConductaPage extends StatelessWidget {
  const OpticaDialogoConductaPage({super.key});
  static const Color brandTeal = Color(0xFF05738D);
  static const Color backgroundGray = Color(0xFFF4F6F9);

  Widget _inputField(String hint, {int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _selectorField(String hint) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          Icon(Icons.menu, size: 20, color: brandTeal),
          const SizedBox(width: 10),
          Text(hint, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _rowWithClose() {
    return Row(
      children: [
        Expanded(child: _inputField('Conducta')),
        const SizedBox(width: 8),
        Expanded(child: _inputField('Descripción')),
        const SizedBox(width: 8),
        IconButton(onPressed: () {}, icon: const Icon(Icons.close, color: Colors.grey)),
      ],
    );
  }

  Widget _cardSection(String title, List<Widget> children) {
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

  Widget _addButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: brandTeal,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: const Text('Añadir'),
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
            const CustomPageHeader(title: 'Diálogo y Conducta'),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: brandTeal),
                child: const Text('Editar', style: TextStyle(fontSize: 16)),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 40),
                child: Column(
                  children: [
                    _cardSection('Conducta', [
                      _selectorField('Seleccione'),
                      const SizedBox(height: 12),
                      Align(alignment: Alignment.centerRight, child: _addButton()),
                      const SizedBox(height: 12),
                      _rowWithClose(),
                    ]),
                    _cardSection('Otros Datos del RIPS', [
                      _inputField('Finalidad de Consulta'),
                      const SizedBox(height: 8),
                      _inputField('Causa Externa'),
                      const SizedBox(height: 8),
                      _inputField('Tipo de Diagnóstico'),
                      const SizedBox(height: 8),
                      _inputField('Condición Usuaria'),
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
