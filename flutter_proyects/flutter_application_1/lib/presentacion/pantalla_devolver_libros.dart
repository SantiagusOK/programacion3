import 'package:flutter/material.dart';
import 'package:flutter_application_1/Dominio/data/adaptadores.dart';
import 'package:flutter_application_1/Dominio/entidades/libro.dart';

class DevolverLibrosPage extends StatelessWidget {
  const DevolverLibrosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Lista de Libros", style: TextStyle(fontSize: 35)),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 30),
        itemCount: adaptadorFirebase.todosLosLibros().length,
        itemBuilder: (BuildContext context, int index) {
          List<Libro> libros = adaptadorFirebase.todosLosLibros();
          return Center(
            child: Column(
              children: [
                Container(
                    width: 500,
                    color: const Color.fromARGB(255, 165, 190, 166),
                    child: Center(
                        child: Text(libros[index].nombre,
                            style: const TextStyle(fontSize: 30)))),
                const SizedBox(height: 30)
              ],
            ),
          );
        },
      ),
    );
  }
}
