import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/favoritos_provider.dart';
import 'screens/inicio_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => FavoritosProvider(),
      child: const AutoExplorerApp(),
    ),
  );
}

class AutoExplorerApp extends StatelessWidget {
  const AutoExplorerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Auto Explorer',
      theme: AppTheme.lightTheme,
      home: const InicioScreen(),
    );
  }
}