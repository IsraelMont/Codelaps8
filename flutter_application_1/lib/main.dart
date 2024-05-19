import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        // Tema claro
        scaffoldBackgroundColor: Colors.white, // Fondo claro
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: const TextStyle(color: Colors.black), // Texto negro
              bodyMedium: const TextStyle(color: Colors.black), // Texto negro
            ),
      ),
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 200,
              flexibleSpace: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      'assets/imagen1.png', // Nueva ruta relativa de la imagen de fondo de la AppBar
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      color: Colors.white.withOpacity(
                          0.5), // Color de fondo claro para superponer sobre la imagen
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: const Text(
                        'HorizonsApp', // Nombre de la aplicación
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black, // Texto negro
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return _buildListItem(context, index);
                },
                childCount: 5, // Limita la lista a 5 lugares turísticos
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    // Lista de lugares turísticos con fechas y descripciones
    List<String> lugares = [
      'Volcán Arenal',
      'Monteverde',
      'Playa Tamarindo',
      'Parque Nacional Manuel Antonio',
      'Río Celeste',
    ];

    List<String> fechas = [
      '3 de abril de 2024',
      '12 de mayo de 2024',
      '18 de junio de 2024',
      '5 de julio de 2024',
      '22 de agosto de 2024',
    ];

    List<String> descripciones = [
      'Un volcán activo con vistas impresionantes y aguas termales relajantes.',
      'Reserva biológica con increíbles bosques nubosos y una variedad de vida silvestre.',
      'Una de las playas más populares con aguas claras y actividades acuáticas.',
      'Hermoso parque con exuberante vegetación tropical y playas pintorescas.',
      'Un río famoso por su distintivo color azul celeste debido a minerales en el agua.',
    ];

    // Asegúrate de que el índice esté dentro del rango de lugares, fechas y descripciones
    if (index >= lugares.length ||
        index >= fechas.length ||
        index >= descripciones.length) {
      return const SizedBox(); // Retorna un contenedor vacío si el índice está fuera de rango
    }

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white), // Bordes con líneas blancas
      ),
      child: ListTile(
        leading: Image.asset(
          'assets/lugar${index + 1}.png', // Nueva ruta relativa de la imagen del lugar turístico
          width: 50,
          height: 50,
          fit: BoxFit.cover, // Ajustar la imagen al tamaño del contenedor
        ),
        title: Text(lugares[index]),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Fecha: ${fechas[index]}'),
            Text(descripciones[index]),
          ],
        ),
        onTap: () {
          // Acción al hacer clic en el elemento
        },
      ),
    );
  }
}
