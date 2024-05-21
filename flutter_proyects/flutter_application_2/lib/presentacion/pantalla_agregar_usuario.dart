import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Dominio/data/adaptadores/adaptador_biblioteca.dart';
import 'package:flutter_application_1/Dominio/entidades/usuario.dart';

class CrearUsuarioPage extends StatelessWidget {
  const CrearUsuarioPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController dniController = TextEditingController();
    TextEditingController nombreController = TextEditingController();
    TextEditingController apellidoController = TextEditingController();
    TextEditingController telefonoController = TextEditingController();
    TextEditingController emailController = TextEditingController();

    void guardarDatos() {
      AdaptadorBibliotecaMemoria adaptador = AdaptadorBibliotecaMemoria();
      Usuario newUsuario = Usuario(
          int.parse(dniController.text),
          nombreController.text,
          apellidoController.text,
          int.parse(telefonoController.text),
          emailController.text);
      adaptador.agregarUsuario(newUsuario);
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text("Crear usuario"), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "D.N.I",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  width: 400,
                  child: TextField(
                    controller: dniController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white),
                  ),
                )
              ],
            ),
            const SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Nombre",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  width: 400,
                  child: TextField(
                    controller: nombreController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white),
                  ),
                )
              ],
            ),
            const SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Apellido",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  width: 400,
                  child: TextField(
                    controller: apellidoController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white),
                  ),
                )
              ],
            ),
            const SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Telefono",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  width: 400,
                  child: TextField(
                    controller: telefonoController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white),
                  ),
                )
              ],
            ),
            const SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Email",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  width: 400,
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white),
                  ),
                )
              ],
            ),
            const SizedBox(height: 50),
            SizedBox(
              width: 400,
              child: ElevatedButton(
                  onPressed: guardarDatos,
                  child: const Text("ACEPTAR",
                      style: TextStyle(color: Colors.black, fontSize: 20))),
            )
          ],
        ),
      ),
    );
  }
}
