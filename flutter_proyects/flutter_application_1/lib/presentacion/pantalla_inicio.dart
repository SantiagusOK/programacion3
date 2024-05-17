import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentacion/pantalla_agregar_libro.dart';
import 'package:flutter_application_1/presentacion/pantalla_agregar_usuario.dart';
import 'package:flutter_application_1/presentacion/pantalla_devolver_libros.dart';
import 'package:flutter_application_1/presentacion/pantalla_devolver_usuarios.dart';
import 'package:flutter_application_1/presentacion/pantalla_registro_retiro.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "MENU PRINCIPAL",
          style: TextStyle(color: Colors.white),
        ),
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
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DevolverLibrosPage()));
                  },
                  child: const Text("Mostrar todo los libros",
                      style: TextStyle(color: Colors.black, fontSize: 30))),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 600,
              height: 60,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CrearLibroPage()));
                  },
                  child: const Text("Agregar un libro",
                      style: TextStyle(color: Colors.black, fontSize: 30))),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 600,
              height: 60,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DevolverUsuarioPage()));
                  },
                  child: const Text("Mostrar todos los usuarios",
                      style: TextStyle(color: Colors.black, fontSize: 30))),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 600,
              height: 60,
              child: ElevatedButton(
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
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegistrarRetiroPage()));
                  },
                  child: const Text("Registrar retiro de un libro",
                      style: TextStyle(color: Colors.black, fontSize: 30))),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 600,
              height: 60,
              child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Registrar devolucion de un libro",
                      style: TextStyle(color: Colors.black, fontSize: 30))),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 600,
              height: 60,
              child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Mostrar todos los libros no devueltos",
                      style: TextStyle(color: Colors.black, fontSize: 30))),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 600,
              height: 60,
              child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Salir",
                      style: TextStyle(color: Colors.black, fontSize: 30))),
            ),
          ],
        ),
      ),
    );
  }
}
