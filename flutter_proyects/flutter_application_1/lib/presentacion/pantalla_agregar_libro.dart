import 'package:flutter/material.dart';
import 'package:flutter_application_1/Dominio/data/adaptadores/adaptador_biblioteca.dart';
import 'package:flutter_application_1/Dominio/entidades/libro.dart';

class CrearLibroPage extends StatelessWidget {
  const CrearLibroPage({super.key});

  @override
  Widget build(BuildContext context) {
    AdaptadorBibliotecaMemoria adaptador = AdaptadorBibliotecaMemoria();

    TextEditingController nombreLibro = TextEditingController();

    void guardarLibro() {
      int newId = adaptador.listaDelibros.length + 1;
      Libro newLibro = Libro(newId, nombreLibro.text, true);
      adaptador.agregarLibro(newLibro);
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          title: const Text("Añadir un Libro", style: TextStyle(fontSize: 35)),
          centerTitle: true),
      body: Center(
        child: SizedBox(
          width: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Nombre del libro",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  TextField(
                      controller: nombreLibro,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white)),
                  const SizedBox(height: 50)
                ],
              ),
              ElevatedButton(
                  onPressed: guardarLibro,
                  child: const Text("ACEPTAR",
                      style: TextStyle(fontSize: 20, color: Colors.black)))
            ],
          ),
        ),
      ),
    );
  }
}
