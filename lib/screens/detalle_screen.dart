import 'package:flutter/material.dart';

import '../models/vehiculo.dart';

class DetalleScreen extends StatelessWidget {
  final Vehiculo vehiculo;

  const DetalleScreen({
    super.key,
    required this.vehiculo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(vehiculo.nombre),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 250,
            width: double.infinity,
            child: Image.network(
              vehiculo.imagenUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: const Color(0xFFECEFF1),
                  child: const Center(
                    child: Icon(
                      Icons.directions_car,
                      size: 90,
                      color: Colors.blueGrey,
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  vehiculo.nombre,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  vehiculo.tipo,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade700,
                  ),
                ),
                const SizedBox(height: 16),
                Card(
                  elevation: 3,
                  child: Column(
                    children: [
                      ListTile(
                        leading: const CircleAvatar(
                          child: Icon(Icons.settings),
                        ),
                        title: const Text('Motor'),
                        subtitle: Text(vehiculo.motor),
                      ),
                      const Divider(height: 1),
                      ListTile(
                        leading: const CircleAvatar(
                          child: Icon(Icons.speed),
                        ),
                        title: const Text('Potencia'),
                        subtitle: Text(vehiculo.potencia),
                      ),
                      const Divider(height: 1),
                      ListTile(
                        leading: const CircleAvatar(
                          child: Icon(Icons.swap_horiz),
                        ),
                        title: const Text('Transmisión'),
                        subtitle: Text(vehiculo.transmision),
                      ),
                      const Divider(height: 1),
                      ListTile(
                        leading: const CircleAvatar(
                          child: Icon(Icons.route),
                        ),
                        title: const Text('Tracción'),
                        subtitle: Text(vehiculo.traccion),
                      ),
                      const Divider(height: 1),
                      ListTile(
                        leading: const CircleAvatar(
                          child: Icon(Icons.local_gas_station),
                        ),
                        title: const Text('Combustible'),
                        subtitle: Text(vehiculo.combustible),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            '${vehiculo.nombre} será agregado a favoritos próximamente',
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.favorite_border),
                    label: const Text('Agregar a favoritos'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}