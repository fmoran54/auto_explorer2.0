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
      body: const Column(
        children: [
          Icon(
            Icons.directions_car,
            size: 80,
          ),
          Text(
            'Bienvenido a Auto Explorer',
          ),
          Text(
            'Descubre algunos autos destacados',
          ),
        ],
      ),
    );
  }
}