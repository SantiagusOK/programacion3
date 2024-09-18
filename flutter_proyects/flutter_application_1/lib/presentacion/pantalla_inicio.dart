import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentacion/pantalla_agregar_libro.dart';
import 'package:flutter_application_1/presentacion/pantalla_agregar_usuario.dart';
import 'package:flutter_application_1/presentacion/pantalla_devolver_libros.dart';
import 'package:flutter_application_1/presentacion/pantalla_devolver_usuarios.dart';
import 'package:flutter_application_1/presentacion/pantalla_librosFaltantes.dart';
import 'package:flutter_application_1/presentacion/pantalla_registro_devolucion.dart';
import 'package:flutter_application_1/presentacion/pantalla_registro_retiro.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title:
            const Text("MENU PRINCIPAL", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 600,
              height: 60,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)))),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DevolverLibrosPage()));
                  },
                  child: const Text("Mostrar todo los libros",
                      style: TextStyle(color: Colors.black, fontSize: 30))),
            ),
            SizedBox(
              width: 600,
              height: 60,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0))),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DevolverUsuarioPage()));
                  },
                  child: const Text("Mostrar todos los usuarios",
                      style: TextStyle(color: Colors.black, fontSize: 30))),
            ),
            SizedBox(
              width: 600,
              height: 60,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)))),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LibrosFaltantesPage()));
                  },
                  child: const Text("Mostrar todos los libros no devueltos",
                      style: TextStyle(color: Colors.black, fontSize: 30))),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 600,
              height: 60,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)))),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CrearLibroPage()));
                  },
                  child: const Text("Agregar un libro",
                      style: TextStyle(color: Colors.black, fontSize: 30))),
            ),
            SizedBox(
              width: 600,
              height: 60,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)))),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CrearUsuarioPage()));
                  },
                  child: const Text("Agregar un usuario",
                      style: TextStyle(color: Colors.black, fontSize: 30))),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 600,
              height: 60,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)))),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegistrarRetiroPage()));
                  },
                  child: const Text("Registrar retiro de un libro",
                      style: TextStyle(color: Colors.black, fontSize: 30))),
            ),
            SizedBox(
              width: 600,
              height: 60,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)))),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegistrarDevolucionPage(),
                        ));
                  },
                  child: const Text("Registrar devolucion de un libro",
                      style: TextStyle(color: Colors.black, fontSize: 30))),
            ),
            const SizedBox(height: 10),

            /*const SizedBox(height: 10),
            SizedBox(
              width: 600,
              height: 60,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PageMovimientos()));
                  },
                  child: const Text("Movimientos",
                      style: TextStyle(color: Colors.black, fontSize: 30))),
            ),*/
            const SizedBox(height: 30),
            SizedBox(
              width: 200,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  exit(0);
                },
                child: const Text("Salir",
                    style: TextStyle(color: Colors.black, fontSize: 30)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
