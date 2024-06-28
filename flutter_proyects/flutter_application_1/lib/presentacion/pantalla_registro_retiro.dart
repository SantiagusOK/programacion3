import 'package:flutter/material.dart';
import 'package:flutter_application_1/Dominio/caso_de_uso/data/adaptadores.dart';
import 'package:flutter_application_1/Dominio/entidades/libro.dart';
import 'package:flutter_application_1/Dominio/entidades/usuario.dart';

class RegistrarRetiroPage extends StatefulWidget {
  const RegistrarRetiroPage({super.key});

  @override
  State<RegistrarRetiroPage> createState() => _RegistrarRetiroPageState();
}

class _RegistrarRetiroPageState extends State<RegistrarRetiroPage> {
  int indexUsuarioSeleccionado = -1;
  int indexLibroSeleccionado = -1;

  void regitrarRetiro() async {
    List<Libro> listaLibro = await adaptadorFirebase.todosLosLibros();
    List<Usuario> listaUsuario = await adaptadorFirebase.todosLosUsuarios();
    DateTime fecha = DateTime.now();
    Usuario usuario = listaUsuario[indexUsuarioSeleccionado];
    Libro libro = listaLibro[indexLibroSeleccionado];
    adminsBiblioteca.registrarEntregaDeLibro(fecha, libro, usuario);

    setState(() {
      indexLibroSeleccionado = -1;
      indexUsuarioSeleccionado = -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 71, 71, 71),
      appBar: AppBar(
        title: const Text("Registrar Retiro"),
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
                onPressed: regitrarRetiro,
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

  Container ListaUsuarios() {
    return Container(
        width: 500,
        height: 500,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 112, 112, 112),
            borderRadius: BorderRadius.circular(5)),
        child: FutureBuilder(
          future: adaptadorFirebase.todosLosUsuarios(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.isNotEmpty) {
                return ListView.separated(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    Usuario user = snapshot.data![index];
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
                );
              } else {
                return const Text("No hay usuarios");
              }
            } else {
              return const CircularProgressIndicator(color: Colors.white);
            }
          },
        ));
  }

  Container ListaLibros() {
    // devuelve un color para el container, dependiendo si el libro esta disponible o no, y si esta disponible, verificara si esta
    //seleccionado, si es asi, devolvera un color rojo, si no, un color gris de modo normal
    Color estadoLibro(bool libroDisponible, index) {
      if (!libroDisponible) {
        return Colors.black;
      }
      if (index == indexLibroSeleccionado) {
        return Colors.red;
      }

      return const Color.fromARGB(255, 134, 134, 134);
    }

    return Container(
        width: 500,
        height: 500,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 112, 112, 112),
            borderRadius: BorderRadius.circular(5)),
        child: FutureBuilder(
          future: adaptadorFirebase.todosLosLibros(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.isNotEmpty) {
                return ListView.separated(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    Libro libro = snapshot.data![index];
                    return SizedBox(
                      height: 100,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  estadoLibro(libro.disponible, index),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          onPressed: () {
                            if (libro.disponible) {
                              setState(() {
                                if (index != indexLibroSeleccionado) {
                                  indexLibroSeleccionado = index;
                                } else {
                                  indexLibroSeleccionado = -1;
                                }
                              });
                            } else {
                              null;
                            }
                          },
                          child: Text(libro.nombre,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 15))),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                );
              } else {
                return const Text("No hay libros");
              }
            } else {
              return const CircularProgressIndicator(color: Colors.white);
            }
          },
        ));
  }
}
