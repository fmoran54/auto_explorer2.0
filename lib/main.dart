import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auto Explorer',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.blueGrey),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool mostrarInformacion = false;

  void mostrarAutoDestacado() {
    setState(() {
      mostrarInformacion = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          'Auto Explorer',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Icon(
              Icons.directions_car,
              size: 60,
              color: Colors.blueGrey,
            ),

            const SizedBox(height: 5),

            Text(
              'Bienvenido a Auto Explorer',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const Text(
              'Descubre algunos autos destacados',
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 10),

            const Card(
              elevation: 3,
              child: ListTile(
                leading: Icon(
                  Icons.directions_car,
                  color: Colors.blueGrey,
                ),
                title: Text('Toyota Supra'),
                subtitle: Text('Auto deportivo'),
              ),
            ),

            const Card(
              elevation: 3,
              child: ListTile(
                leading: Icon(
                  Icons.directions_car,
                  color: Colors.blueGrey,
                ),
                title: Text('Ford Mustang'),
                subtitle: Text('Muscle car'),
              ),
            ),

            const Card(
              elevation: 3,
              child: ListTile(
                leading: Icon(
                  Icons.directions_car,
                  color: Colors.blueGrey,
                ),
                title: Text('Nissan GT-R'),
                subtitle: Text('Deportivo japonés'),
              ),
            ),

            const Card(
              elevation: 3,
              child: ListTile(
                leading: Icon(
                  Icons.directions_car,
                  color: Colors.blueGrey,
                ),
                title: Text('Chevrolet Corvette'),
                subtitle: Text('Deportivo americano'),
              ),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
                foregroundColor: Colors.white,
              ),
              onPressed: mostrarAutoDestacado,
              child: const Text('Ver auto destacado'),
            ),

            const SizedBox(height: 10),

            if (!mostrarInformacion)
              const Text(
                'Presiona el botón para ver el auto destacado',
                textAlign: TextAlign.center,
              ),

            if (mostrarInformacion)
              const Card(
                elevation: 3,
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Text(
                        'Auto destacado: Nissan GT-R',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),

                      SizedBox(height: 8),

                      Text('Tipo: Deportivo japonés'),
                      Text('Motor: 3.8 L V6 Twin Turbo'),
                      Text('Cilindrada: 3,799 cc'),
                      Text('Potencia: 565 HP'),
                      Text(
                        'Transmisión: Automática de doble embrague, 6 velocidades',
                        textAlign: TextAlign.center,
                      ),
                      Text('Tracción: AWD'),
                      Text('Combustible: Gasolina'),
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