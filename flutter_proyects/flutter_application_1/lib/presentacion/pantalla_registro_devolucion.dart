import 'package:flutter/material.dart';
import 'package:flutter_application_1/Dominio/caso_de_uso/data/adaptadores.dart';
import 'package:flutter_application_1/Dominio/entidades/libro.dart';
import 'package:flutter_application_1/Dominio/entidades/usuario.dart';

class RegistrarDevolucionPage extends StatefulWidget {
  const RegistrarDevolucionPage({super.key});

  @override
  State<RegistrarDevolucionPage> createState() =>
      _RegistrarDevolucionPageState();
}

class _RegistrarDevolucionPageState extends State<RegistrarDevolucionPage> {
  int indexUsuarioSeleccionado = -1;
  int indexLibroSeleccionado = -1;
  List<Libro> librosNoDisponibles = [];

  void regitrarDevolucion() async {
    DateTime fecha = DateTime.now();
    List<Usuario> listaUsuariosFirebase =
        await adaptadorFirebase.todosLosUsuarios();
    List<Libro> listaLibrosFirebase = await adaptadorFirebase.todosLosLibros();

    Usuario usuario = listaUsuariosFirebase[indexUsuarioSeleccionado];
    Libro libro = listaLibrosFirebase[indexLibroSeleccionado];

    adminsBiblioteca.registrarDevolucionDeLibro(fecha, libro, usuario);

    setState(() {
      librosNoDisponibles.removeAt(indexLibroSeleccionado);
      indexLibroSeleccionado = -1;
      indexUsuarioSeleccionado = -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 71, 71, 71),
      appBar: AppBar(
        title: const Text("Registrar Devolucion"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(children: [
                  const Text("Usuarios",
                      style: TextStyle(fontSize: 30, color: Colors.white)),
                  ListaUsuarios()
                ]),
                const SizedBox(width: 10),
                Column(children: [
                  const Text("Libros",
                      style: TextStyle(fontSize: 30, color: Colors.white)),
                  ListaLibros()
                ]),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 500,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
                onPressed: regitrarDevolucion,
                child: const Text(
                  "REGISTRAR",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  FutureBuilder ListaUsuarios() {
    return FutureBuilder(
      future: adaptadorFirebase.todosLosUsuarios(),
      builder: (context, snapshot) {
        return Container(
          width: 500,
          height: 500,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 112, 112, 112),
              borderRadius: BorderRadius.circular(5)),
          child: ListView.separated(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              Usuario user = snapshot.data[index];
              return SizedBox(
                height: 100,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: index == indexUsuarioSeleccionado
                            ? Colors.red
                            : const Color.fromARGB(255, 134, 134, 134),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      setState(() {
                        if (index != indexUsuarioSeleccionado) {
                          indexUsuarioSeleccionado = index;
                        } else {
                          indexUsuarioSeleccionado = -1;
                        }
                      });
                    },
                    child: Text(
                        "${user.nombre} ${user.apellido}\nD.N.I: ${user.dni}",
                        style: const TextStyle(
                            color: Colors.white, fontSize: 15))),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          ),
        );
      },
    );
  }

  FutureBuilder ListaLibros() {
    Color colorSeleccion(index) {
      if (index == indexLibroSeleccionado) {
        return Colors.red;
      }

      return const Color.fromARGB(255, 134, 134, 134);
    }

    return FutureBuilder(
      future: adaptadorFirebase.todosLosLibros(),
      builder: (context, snapshot) {
        return Container(
            width: 500,
            height: 500,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 112, 112, 112),
                borderRadius: BorderRadius.circular(5)),
            child: snapshot.data.isNotEmpty
                ? ListView.separated(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      //print(librosNoDisponibles[index].nombre);
                      Libro libro = snapshot.data[index];
                      return SizedBox(
                        height: 100,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: colorSeleccion(index),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () {
                              setState(() {
                                if (index != indexLibroSeleccionado) {
                                  indexLibroSeleccionado = index;
                                } else {
                                  indexLibroSeleccionado = -1;
                                }
                              });
                            },
                            child: Text(libro.nombre,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 15))),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                  )
                : null);
      },
    );
  }
}
