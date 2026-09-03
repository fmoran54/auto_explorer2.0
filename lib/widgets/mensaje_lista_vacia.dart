import 'package:flutter/material.dart';

class MensajeListaVacia extends StatelessWidget {
  final IconData icono;
  final String titulo;
  final String mensaje;

  const MensajeListaVacia({
    super.key,
    required this.icono,
    required this.titulo,
    required this.mensaje,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icono,
              size: 80,
              color: Colors.blueGrey,
            ),
            const SizedBox(height: 16),
            Text(
              titulo,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              mensaje,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}