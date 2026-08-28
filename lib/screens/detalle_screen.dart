import 'package:flutter/material.dart';

import '../data/favoritos_data.dart';
import '../models/vehiculo.dart';

class DetalleScreen extends StatefulWidget {
  final Vehiculo vehiculo;

  const DetalleScreen({
    super.key,
    required this.vehiculo,
  });

  @override
  State<DetalleScreen> createState() => _DetalleScreenState();
}

class _DetalleScreenState extends State<DetalleScreen> {
  bool get esFavorito {
    return vehiculosFavoritos.any(
      (vehiculo) => vehiculo.id == widget.vehiculo.id,
    );
  }

  void cambiarFavorito() {
    final estabaEnFavoritos = esFavorito;

    setState(() {
      if (estabaEnFavoritos) {
        vehiculosFavoritos.removeWhere(
          (vehiculo) => vehiculo.id == widget.vehiculo.id,
        );
      } else {
        vehiculosFavoritos.add(widget.vehiculo);
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          estabaEnFavoritos
              ? '${widget.vehiculo.nombre} fue eliminado de favoritos'
              : '${widget.vehiculo.nombre} fue agregado a favoritos',
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final vehiculo = widget.vehiculo;

    return Scaffold(
      appBar: AppBar(
        title: Text(vehiculo.nombre),
        actions: [
          IconButton(
            tooltip: esFavorito
                ? 'Eliminar de favoritos'
                : 'Agregar a favoritos',
            onPressed: cambiarFavorito,
            icon: Icon(
              esFavorito ? Icons.favorite : Icons.favorite_border,
              color: esFavorito ? Colors.redAccent : Colors.white,
            ),
          ),
        ],
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
                    onPressed: cambiarFavorito,
                    icon: Icon(
                      esFavorito
                          ? Icons.favorite
                          : Icons.favorite_border,
                    ),
                    label: Text(
                      esFavorito
                          ? 'Quitar de favoritos'
                          : 'Agregar a favoritos',
                    ),
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