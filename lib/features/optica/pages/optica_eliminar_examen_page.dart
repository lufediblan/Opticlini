import 'package:flutter/material.dart';
import '../../../core/widgets/custom_page_header.dart';

class OpticaEliminarExamenPage extends StatefulWidget {
  const OpticaEliminarExamenPage({super.key});

  @override
  State<OpticaEliminarExamenPage> createState() => _OpticaEliminarExamenPageState();
}

class _OpticaEliminarExamenPageState extends State<OpticaEliminarExamenPage> {
  int? selectedIndex;

  final List<String> examDates = [
    '25/01/2020',
    '25/01/2021',
    '25/01/2022',
    '25/01/2025',
  ];

  final TextEditingController reasonController = TextEditingController();

  static const Color brandTeal = Color(0xFF05738D);
  static const Color backgroundGray = Color(0xFFF4F6F9);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundGray,
      body: SafeArea(
        child: Column(
          children: [
            const CustomPageHeader(title: 'Eliminar Examen'),
            const SizedBox(height: 12),

            // Lista de fechas
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
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
                      margin: const EdgeInsets.only(bottom: 12),
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

            const SizedBox(height: 12),

            // Motivo
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x22000000),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    )
                  ],
                ),
                child: TextField(
                  controller: reasonController,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(16),
                    border: InputBorder.none,
                    hintText: 'Escriba el motivo:',
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Botón Eliminar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36),
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Acción de eliminación
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: brandTeal,
                  minimumSize: const Size.fromHeight(48),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Eliminar', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
