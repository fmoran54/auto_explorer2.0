import 'package:flutter/material.dart';

class CaracteristicaVehiculo extends StatelessWidget {
  final IconData icono;
  final String titulo;
  final String valor;

  const CaracteristicaVehiculo({
    super.key,
    required this.icono,
    required this.titulo,
    required this.valor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Icon(icono),
      ),
      title: Text(titulo),
      subtitle: Text(valor),
    );
  }
}