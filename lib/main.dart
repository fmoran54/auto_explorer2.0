import 'package:flutter/material.dart';

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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auto Explorer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Icon(
              Icons.directions_car,
              size: 70,
              color: Colors.blueGrey,
            ),
            const SizedBox(height: 10),
            const Text(
              'Bienvenido a Auto Explorer',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Descubre algunos autos destacados',
            ),
            const SizedBox(height: 20),
            Card(
              child: ListTile(
                leading: const Icon(Icons.directions_car),
                title: const Text('Toyota Supra'),
                subtitle: const Text('Auto deportivo'),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.directions_car),
                title: const Text('Ford Mustang'),
                subtitle: const Text('Muscle car'),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.directions_car),
                title: const Text('Nissan GT-R'),
                subtitle: const Text('Deportivo japonés'),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.directions_car),
                title: const Text('Chevrolet Corvette'),
                subtitle: const Text('Deportivo americano'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}