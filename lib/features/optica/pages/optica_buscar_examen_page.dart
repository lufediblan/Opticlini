import 'package:flutter/material.dart';
import '../../../core/widgets/custom_page_header.dart';

class OpticaBuscarExamenPage extends StatefulWidget {
  const OpticaBuscarExamenPage({super.key});

  @override
  State<OpticaBuscarExamenPage> createState() => _OpticaBuscarExamenPageState();
}

class _OpticaBuscarExamenPageState extends State<OpticaBuscarExamenPage> {
  int? selectedIndex;

  final List<String> examDates = [
    '25/01/2020',
    '25/01/2021',
    '25/01/2022',
    '25/01/2025',
  ];

  static const Color brandTeal = Color(0xFF05738D);
  static const Color backgroundGray = Color(0xFFF4F6F9);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundGray,
      body: SafeArea(
        child: Column(
          children: [
            const CustomPageHeader(title: 'Buscar Examen'),
            const SizedBox(height: 12),

            // Lista de fechas
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x22000000),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: List.generate(examDates.length, (index) {
                    final isSelected = selectedIndex == index;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Fecha: ${examDates[index]}',
                                style: const TextStyle(fontWeight: FontWeight.w600)),
                            Icon(
                              isSelected ? Icons.check_box : Icons.check_box_outline_blank,
                              color: isSelected ? brandTeal : Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Botón Aceptar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36),
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Acción de búsqueda
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: brandTeal,
                  minimumSize: const Size.fromHeight(48),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Aceptar', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
