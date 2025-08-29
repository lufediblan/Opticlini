import 'package:flutter/material.dart';

class ClinicalHistoryPage extends StatelessWidget {
  const ClinicalHistoryPage({super.key});

  // Colores del proyecto
  static const Color brand = Color(0xFF05738D);
  static const Color headerGray = Color(0xFFEEEEEE);
  static const Color hintGray = Color(0xFFB8B8B8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 24),
          children: [
            // ===== Header (igual a otras pantallas) =====
            Container(
              height: 136,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: headerGray,
                borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(20)),
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

            // ===== Píldora con back + icono + título =====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
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
                child: Row(
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(24),
                      onTap: () => Navigator.pop(context),
                      child: const Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: Icon(Icons.chevron_left, size: 40, color: brand),
                      ),
                    ),
                    const Icon(Icons.assignment, color: brand),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Text(
                        'Historia Clinica',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 35),

            // ===== Burbuja de instrucción =====
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: _InstructionBubble(
                text:
                'Ingresar todos los datos para solicitar la copia de la historia clinica',
              ),
            ),

            const SizedBox(height: 35),

            // ===== Formulario =====
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: _HistoryForm(),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------- Widgets privados ----------

class _InstructionBubble extends StatelessWidget {
  const _InstructionBubble({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(color: Color(0x33000000), blurRadius: 14, offset: Offset(0, 8)),
        ],
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 15.5, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class _HistoryForm extends StatelessWidget {
  const _HistoryForm();

  static const Color brand = ClinicalHistoryPage.brand;
  static const Color hintGray = ClinicalHistoryPage.hintGray;

  InputDecoration _dec(String hint, IconData icon) => InputDecoration(
    hintText: hint,
    hintStyle: const TextStyle(color: hintGray, fontWeight: FontWeight.w700),
    prefixIcon: Icon(icon,size: 30, color: Colors.grey.shade700),
    filled: true,
    fillColor: Colors.white,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: brand, width: 1.4),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(decoration: _dec('Nombre', Icons.person)),
        const SizedBox(height: 12),
        TextField(decoration: _dec('Numero de identidad', Icons.badge_outlined)),
        const SizedBox(height: 12),
        TextField(decoration: _dec('Correo', Icons.email_outlined), keyboardType: TextInputType.emailAddress),
        const SizedBox(height: 12),
        TextField(decoration: _dec('Telefono', Icons.phone_outlined), keyboardType: TextInputType.phone),

        const SizedBox(height: 35),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Nota: La historia clinica le llegara al correo.',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ),

        const SizedBox(height: 35),
        SizedBox(
          height: 48,
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: brand,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              textStyle: const TextStyle(fontWeight: FontWeight.w800),
            ),
            onPressed: () {},
            // Dos líneas como en tu captura
            child: const Text('Pedir Historia Clinica', textAlign: TextAlign.center),
          ),
        ),
      ],
    );
  }
}
