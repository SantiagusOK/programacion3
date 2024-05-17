import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentacion/pantalla_inicio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Trabajo Practico N°2',
      home: MainPage(),
    );
  }
}
