import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/vehiculo.dart';
import '../providers/favoritos_provider.dart';
import '../widgets/caracteristica_vehiculo.dart';

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
  void cambiarFavorito(FavoritosProvider favoritosProvider) {
    final estabaEnFavoritos = favoritosProvider.esFavorito(
      widget.vehiculo,
    );

    favoritosProvider.alternarFavorito(widget.vehiculo);

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

  Future<void> abrirSitioOficial() async {
    final Uri enlace = Uri.parse(widget.vehiculo.sitioWeb);

    final bool seAbrio = await launchUrl(
      enlace,
      mode: LaunchMode.externalApplication,
    );

    if (!seAbrio && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'No fue posible abrir el sitio oficial',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final vehiculo = widget.vehiculo;

    return Consumer<FavoritosProvider>(
      builder: (context, favoritosProvider, child) {
        final esFavorito = favoritosProvider.esFavorito(vehiculo);

        return Scaffold(
          appBar: AppBar(
            title: Text(vehiculo.nombre),
            actions: [
              IconButton(
                tooltip: esFavorito
                    ? 'Eliminar de favoritos'
                    : 'Agregar a favoritos',
                onPressed: () {
                  cambiarFavorito(favoritosProvider);
                },
                icon: Icon(
                  esFavorito
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: esFavorito
                      ? Colors.redAccent
                      : Colors.white,
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
                          CaracteristicaVehiculo(
                            icono: Icons.settings,
                            titulo: 'Motor',
                            valor: vehiculo.motor,
                          ),
                          const Divider(height: 1),
                          CaracteristicaVehiculo(
                            icono: Icons.speed,
                            titulo: 'Potencia',
                            valor: vehiculo.potencia,
                          ),
                          const Divider(height: 1),
                          CaracteristicaVehiculo(
                            icono: Icons.swap_horiz,
                            titulo: 'Transmisión',
                            valor: vehiculo.transmision,
                          ),
                          const Divider(height: 1),
                          CaracteristicaVehiculo(
                            icono: Icons.route,
                            titulo: 'Tracción',
                            valor: vehiculo.traccion,
                          ),
                          const Divider(height: 1),
                          CaracteristicaVehiculo(
                            icono: Icons.local_gas_station,
                            titulo: 'Combustible',
                            valor: vehiculo.combustible,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          cambiarFavorito(favoritosProvider);
                        },
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
                    const SizedBox(height: 8),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: abrirSitioOficial,
                        icon: const Icon(Icons.open_in_new),
                        label: const Text('Visitar sitio oficial'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}