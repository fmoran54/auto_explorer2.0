import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'favoritos_screen.dart';
import 'vehiculos_screen.dart';

class InicioScreen extends StatefulWidget {
  const InicioScreen({super.key});

  @override
  State<InicioScreen> createState() => _InicioScreenState();
}

class _InicioScreenState extends State<InicioScreen> {
  bool mostrarInformacion = false;

  void mostrarAutoDestacado() {
    setState(() {
      mostrarInformacion = !mostrarInformacion;
    });
  }

  void abrirCatalogo() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const VehiculosScreen(),
      ),
    );
  }

  void abrirFavoritos() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const FavoritosScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auto Explorer'),
        actions: [
          IconButton(
            tooltip: 'Mis favoritos',
            onPressed: abrirFavoritos,
            icon: const Icon(Icons.favorite),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Center(
              child: Container(
                width: 130,
                height: 130,
                padding: const EdgeInsets.all(6),
                child: Image.asset(
                  'assets/images/logo_auto_explorer.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'Bienvenido a Auto Explorer',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Descubre algunos autos destacados',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Card(
              elevation: 3,
              child: ListTile(
                leading: Icon(
                  Icons.directions_car,
                  color: Colors.blueGrey,
                ),
                title: Text('Toyota Supra'),
                subtitle: Text('Auto deportivo'),
              ),
            ),
            const Card(
              elevation: 3,
              child: ListTile(
                leading: Icon(
                  Icons.directions_car,
                  color: Colors.blueGrey,
                ),
                title: Text('Ford Mustang'),
                subtitle: Text('Muscle car'),
              ),
            ),
            const Card(
              elevation: 3,
              child: ListTile(
                leading: Icon(
                  Icons.directions_car,
                  color: Colors.blueGrey,
                ),
                title: Text('Nissan GT-R'),
                subtitle: Text('Deportivo japonés'),
              ),
            ),
            const Card(
              elevation: 3,
              child: ListTile(
                leading: Icon(
                  Icons.directions_car,
                  color: Colors.blueGrey,
                ),
                title: Text('Chevrolet Corvette'),
                subtitle: Text('Deportivo americano'),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: abrirCatalogo,
                icon: const Icon(Icons.grid_view),
                label: const Text('Explorar catálogo'),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: abrirFavoritos,
                icon: const Icon(Icons.favorite),
                label: const Text('Ver mis favoritos'),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: mostrarAutoDestacado,
                icon: Icon(
                  mostrarInformacion
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
                label: Text(
                  mostrarInformacion
                      ? 'Ocultar auto destacado'
                      : 'Ver auto destacado',
                ),
              ),
            ),
            const SizedBox(height: 10),
            if (!mostrarInformacion)
              const Text(
                'Presiona el botón para ver el auto destacado',
                textAlign: TextAlign.center,
              ),
            if (mostrarInformacion)
              const Card(
                elevation: 3,
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Text(
                        'Auto destacado: Nissan GT-R',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text('Tipo: Deportivo japonés'),
                      Text('Motor: 3.8 L V6 Twin Turbo'),
                      Text('Cilindrada: 3,799 cc'),
                      Text('Potencia: 565 HP'),
                      Text(
                        'Transmisión: Automática de doble embrague, 6 velocidades',
                        textAlign: TextAlign.center,
                      ),
                      Text('Tracción: AWD'),
                      Text('Combustible: Gasolina'),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}