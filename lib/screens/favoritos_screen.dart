import 'package:flutter/material.dart';

import '../data/favoritos_data.dart';
import '../models/vehiculo.dart';
import 'detalle_screen.dart';

class FavoritosScreen extends StatefulWidget {
  const FavoritosScreen({super.key});

  @override
  State<FavoritosScreen> createState() => _FavoritosScreenState();
}

class _FavoritosScreenState extends State<FavoritosScreen> {
  void eliminarFavorito(Vehiculo vehiculo) {
    setState(() {
      vehiculosFavoritos.removeWhere(
        (favorito) => favorito.id == vehiculo.id,
      );
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '${vehiculo.nombre} fue eliminado de favoritos',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis favoritos'),
      ),
      body: vehiculosFavoritos.isEmpty
          ? const Center(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.favorite_border,
                      size: 80,
                      color: Colors.blueGrey,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Todavía no tienes vehículos favoritos',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Agrega vehículos desde la pantalla de detalles.',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: vehiculosFavoritos.length,
              itemBuilder: (context, index) {
                final vehiculo = vehiculosFavoritos[index];

                return Card(
                  elevation: 3,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blueGrey.shade100,
                      backgroundImage: NetworkImage(
                        vehiculo.imagenUrl,
                      ),
                    ),
                    title: Text(
                      vehiculo.nombre,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(vehiculo.tipo),
                    trailing: IconButton(
                      tooltip: 'Eliminar de favoritos',
                      icon: const Icon(
                        Icons.delete_outline,
                        color: Colors.redAccent,
                      ),
                      onPressed: () {
                        eliminarFavorito(vehiculo);
                      },
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetalleScreen(
                            vehiculo: vehiculo,
                          ),
                        ),
                      ).then((_) {
                        setState(() {});
                      });
                    },
                  ),
                );
              },
            ),
    );
  }
}