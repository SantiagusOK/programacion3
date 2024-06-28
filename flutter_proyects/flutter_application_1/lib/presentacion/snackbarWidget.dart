import 'package:flutter/material.dart';

class SnakbarMensaje extends StatelessWidget {
  const SnakbarMensaje({super.key, required this.mensaje, required this.color});

  final String mensaje;
  final Color color;
  // no funco
  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Text(mensaje),
      action: SnackBarAction(
        backgroundColor: color,
        textColor: Colors.white,
        label: 'cerrar',
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    );
  }
}
