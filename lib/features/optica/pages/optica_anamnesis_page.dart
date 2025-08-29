import 'package:flutter/material.dart';
import '../../../core/widgets/custom_page_header.dart';

class OpticaAnamnesisPage extends StatelessWidget {
  const OpticaAnamnesisPage({super.key});

  static const Color brandTeal = Color(0xFF05738D);

  Widget _input(String hint, IconData icon) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(icon, color: brandTeal), // Azul
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

  Widget _textArea(String hint) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: TextField(
        maxLines: 3,
        decoration: InputDecoration(
          hintText: hint,
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
        Expanded(child: _input(hint1, icon1)),
        const SizedBox(width: 8),
        Expanded(child: _input(hint2, icon2)),
      ],
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Text(
        title,
        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
      ),
    );
  }

  Widget _groupCard({required Widget child}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFEDEDED),
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(
            color: Color(0x26000000),
            blurRadius: 8,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F9),
      body: SafeArea(
        child: Column(
          children: [
            const CustomPageHeader(title: 'Anamnesis'),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Editar'),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 40),
                child: Column(
                  children: [
                    _sectionTitle('Cabecera de Consulta:'),
                    _groupCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _input('Tipo de consulta', Icons.menu),
                          const Padding(
                            padding: EdgeInsets.only(left: 18.0, top: 4),
                            child: Text('Profesional'),
                          ),
                          _doubleInput('Nombre', Icons.person, 'Segundo Nombre', Icons.person),
                          _doubleInput('Apellido', Icons.person, 'Segundo Apellido', Icons.person),
                          _doubleInput('Fecha de consulta', Icons.calendar_today, 'Ultimo Control', Icons.refresh),
                        ],
                      ),
                    ),

                    _sectionTitle('Motivo de consulta:'),
                    _groupCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _input('Sintoma Principal', Icons.menu),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                            child: Text('Descripcion'),
                          ),
                          _textArea(''),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                            child: Text('Otros Sintomas'),
                          ),
                          _textArea(''),
                        ],
                      ),
                    ),

                    _sectionTitle('Antecedentes Personales'),
                    _groupCard(child: _textArea('')),

                    _sectionTitle('Antecedentes Familiares'),
                    _groupCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _textArea(''),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                            child: Text('Antecedentes Familiares Oculares'),
                          ),
                          _textArea(''),
                        ],
                      ),
                    ),

                    _sectionTitle('Responsable / Acompañante'),
                    _groupCard(
                      child: Column(
                        children: [
                          _doubleInput('Nombre', Icons.person, 'Apellido', Icons.person),
                          _doubleInput('Telefono', Icons.phone, 'Telefono', Icons.phone),
                          _doubleInput('Tipo de documento', Icons.menu, 'Numero de documento', Icons.tag),
                          _input('Parentesco', Icons.people),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 36),
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('Guardar'),
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('Continuar'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 36),
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
