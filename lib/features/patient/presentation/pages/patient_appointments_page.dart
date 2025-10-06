import 'package:flutter/material.dart';

class PatientAppointmentsPage extends StatelessWidget {
  const PatientAppointmentsPage({super.key});

  static const Color brand = Color(0xFF05738D);
  static const Color headerGray = Color(0xFFEEEEEE);
  static const Color hintGray = Color(0xFF9E9E9E);

  // Estilos unificados
  static const TextStyle kTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w800,
    color: Colors.black,
    shadows: [Shadow(color: Color(0x33000000), offset: Offset(0, 1), blurRadius: 2)],
  );

  static const TextStyle kSubtitle = TextStyle(
    fontSize: 17,
    height: 1.25,
    color: Colors.black87,
    shadows: [Shadow(color: Color(0x1A000000), offset: Offset(0, 1), blurRadius: 1.5)],
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 28), // padding solo header
        children: [
          // ===== Header =====
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

          const SizedBox(height: 52),

          // ===== Contenido con padding horizontal 24 =====
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                // ===== UBICACIÓN + HORARIOS (fila) =====
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: const [
                      BoxShadow(color: Color(0x22000000), blurRadius: 16, offset: Offset(0, 8)),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center, // ⬅︎ centra verticalmente la imagen
                    children: [
                      // FOTO A LA IZQUIERDA (ligeramente más pequeña para dar más ancho al texto)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Image.asset(
                          'assets/ubicacion.png',
                          width: 116,     // antes 120
                          height: 116,    // cuadrada para que centre perfecto
                          fit: BoxFit.cover,
                        ),
                      ),

                      const SizedBox(width: 14), // ⬅︎ más espacio entre foto y texto

                      // TEXTOS CON PADDING A LA DERECHA
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 2), // ⬅︎ aire a la derecha
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              // usa tus estilos con sombra
                              Text('Estamos Ubicados', style: PatientAppointmentsPage.kTitle),
                              SizedBox(height: 6),
                              Text(
                                'En Soledad Cra 30 No.23a-87',
                                style: PatientAppointmentsPage.kSubtitle,
                              ),
                              SizedBox(height: 12),
                              Text('Horarios', style: PatientAppointmentsPage.kTitle),
                              SizedBox(height: 6),
                              Text(
                                'De Lunes a Viernes\n9:00-12:00Am - 2:00-6:30Pm\nSábados\n9:00-1:00Am - 2:00-4:30Pm',
                                style: PatientAppointmentsPage.kSubtitle,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 35),

                // Pedir citas
                const Center(child: Text('Pedir Citas', style: kTitle)),
                const SizedBox(height: 35),

                // Burbuja
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const [
                      BoxShadow(color: Color(0x33000000), blurRadius: 20, offset: Offset(0, 10)),
                    ],
                  ),
                  child: const Text(
                    'Ingresar todos los datos para solicitar la cita para tu examen visual',
                    textAlign: TextAlign.center,
                    style: kSubtitle,
                  ),
                ),

                const SizedBox(height: 18),

                // Inputs
                _input(hint: 'Nombre', icon: Icons.person),
                _input(hint: 'Numero de identidad', icon: Icons.badge_outlined),
                _input(hint: 'Correo', icon: Icons.email_outlined),
                _input(hint: 'Telefono', icon: Icons.phone_outlined),
                _input(hint: 'Hora', icon: Icons.access_time),

                const SizedBox(height: 18),

                // Botón
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: brand,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      textStyle: const TextStyle(fontWeight: FontWeight.w800),
                      elevation: 2,
                    ),
                    onPressed: () {},
                    child: const Text('Solicitar Cita'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Campo de texto
  static Widget _input({required String hint, required IconData icon}) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: kSubtitle.copyWith(color: hintGray),
          prefixIcon: Icon(icon, color: hintGray,size:30,), // 👈 aquí ya no es const
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: brand, width: 1.5),
          ),
        ),
        style: kSubtitle,
      ),
    );
  }
}
