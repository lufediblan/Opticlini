import 'package:flutter/material.dart';

class OpticaHomePage extends StatelessWidget {
  const OpticaHomePage({super.key});

  static const Color brand = Color(0xFF05738D);   // turquesa de la app
  static const Color headerGray = Color(0xFFEEEEEE);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 28),
          children: [
            // ===== Header (mismo tamaño; ícono CENTRADO) =====
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
                  const SizedBox(width: 40),
                  const Expanded(
                    child: Center(
                      child: CircleAvatar(
                        radius: 29,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person, color: brand, size: 49),
                      ),
                    ),
                  ),
                  Image.asset('assets/logo2.png', height: 82),
                ],
              ),
            ),

            const SizedBox(height: 42),

            // ===== Acciones =====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  _ActionTile(
                    asset: 'assets/op_add.png',
                    title: 'Agregar Paciente',
                    onTap: () {
                      Navigator.pushNamed(context, '/optica/add_patient');
                    },
                  ),
                  const SizedBox(height: 20),
                  _ActionTile(
                    asset: 'assets/op_remove.png',
                    title: 'Eliminar Paciente',
                    onTap: () {
                      Navigator.pushNamed(context, '/optica/remove_patient');
                    },
                  ),
                  const SizedBox(height: 20),
                  _ActionTile(
                    asset: 'assets/op_history.png',
                    title: 'Historia Clinica',
                    onTap: () {
                      Navigator.pushNamed(context, '/optica/history');
                    },
                  )
                ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Tarjeta/píldora con icono + texto
class _ActionTile extends StatelessWidget {
  const _ActionTile({
    required this.asset,
    required this.title,
    this.onTap,
  });

  final String asset;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(26),
        boxShadow: const [
          BoxShadow(color: Color(0x1F000000), blurRadius: 18, offset: Offset(0, 10)),
          BoxShadow(color: Color(0x0F000000), blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(26),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
            child: Row(
              children: [
                Image.asset(
                  asset,
                  width: 34,
                  height: 34,
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                      shadows: [
                        Shadow(color: Color(0x33000000), offset: Offset(0, 1), blurRadius: 2),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
