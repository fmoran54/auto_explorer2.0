import 'package:flutter/material.dart';

import '../data/vehiculos_data.dart';
import '../widgets/vehiculo_card.dart';
import 'detalle_screen.dart';

class VehiculosScreen extends StatelessWidget {
  const VehiculosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de vehículos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: vehiculos.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.78,
          ),
          itemBuilder: (context, index) {
            final vehiculo = vehiculos[index];

            return VehiculoCard(
              vehiculo: vehiculo,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetalleScreen(
                      vehiculo: vehiculo,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}