import 'package:flutter/material.dart';
import '../../../core/widgets/custom_page_header.dart';

class OpticaClinicalHistoryPage extends StatelessWidget {
  const OpticaClinicalHistoryPage({super.key});

  static const Color brandTeal = Color(0xFF05738D);

  Widget _searchInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: TextField(
        decoration: InputDecoration(
          hintText: '1021393873',
          prefixIcon: const Icon(Icons.search, color: brandTeal),
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

  Widget _actionTile(String title, String assetPath, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: Container(
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
                  Image.asset(assetPath, width: 30, height: 30),
                  const SizedBox(width: 14),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
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
            const CustomPageHeader(title: 'Historia clínica'),
            _searchInput(),
            _actionTile('Datos', 'assets/ic_user.png', () {
              Navigator.pushNamed(context, '/optica/patient-data');
            }),
            _actionTile('Agregar Examen', 'assets/ic_add_exam.png', () {
              Navigator.pushNamed(context, '/optica/add-exam');
            }),
            _actionTile('Eliminar Examen', 'assets/ic_delete_exam.png', () {
              Navigator.pushNamed(context, '/optica/eliminar-examen');
            }),
            _actionTile('Buscar Examen', 'assets/ic_search_exam.png', () {
              Navigator.pushNamed(context, '/optica/buscar-examen');
            }),
          ],
        ),
      ),
    );
  }
}
