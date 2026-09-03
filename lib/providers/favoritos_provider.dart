import 'package:flutter/material.dart';

import '../models/vehiculo.dart';

class FavoritosProvider extends ChangeNotifier {
  final List<Vehiculo> _vehiculosFavoritos = [];

  List<Vehiculo> get vehiculosFavoritos =>
      List.unmodifiable(_vehiculosFavoritos);

  int get cantidadFavoritos => _vehiculosFavoritos.length;

  bool esFavorito(Vehiculo vehiculo) {
    return _vehiculosFavoritos.any(
      (favorito) => favorito.id == vehiculo.id,
    );
  }

  void alternarFavorito(Vehiculo vehiculo) {
    if (esFavorito(vehiculo)) {
      _vehiculosFavoritos.removeWhere(
        (favorito) => favorito.id == vehiculo.id,
      );
    } else {
      _vehiculosFavoritos.add(vehiculo);
    }

    notifyListeners();
  }

  void eliminarFavorito(Vehiculo vehiculo) {
    _vehiculosFavoritos.removeWhere(
      (favorito) => favorito.id == vehiculo.id,
    );

    notifyListeners();
  }
}