import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/vehiculo.dart';
import '../providers/favoritos_provider.dart';
import '../widgets/mensaje_lista_vacia.dart';
import 'detalle_screen.dart';

class FavoritosScreen extends StatelessWidget {
  const FavoritosScreen({super.key});

  void eliminarFavorito(
    BuildContext context,
    FavoritosProvider favoritosProvider,
    Vehiculo vehiculo,
  ) {
    favoritosProvider.eliminarFavorito(vehiculo);

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
      body: Consumer<FavoritosProvider>(
        builder: (context, favoritosProvider, child) {
          final vehiculosFavoritos =
              favoritosProvider.vehiculosFavoritos;

          if (vehiculosFavoritos.isEmpty) {
            return const MensajeListaVacia(
              icono: Icons.favorite_border,
              titulo: 'Todavía no tienes vehículos favoritos',
              mensaje:
                  'Agrega vehículos desde la pantalla de detalles.',
            );
          }

          return ListView.builder(
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
                      eliminarFavorito(
                        context,
                        favoritosProvider,
                        vehiculo,
                      );
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
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}