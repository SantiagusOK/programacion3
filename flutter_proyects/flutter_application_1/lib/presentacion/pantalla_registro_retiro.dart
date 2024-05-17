import 'package:flutter/material.dart';
import 'package:flutter_application_1/Dominio/caso_de_uso/administracion_de_biblioteca.dart';
import 'package:flutter_application_1/Dominio/data/adaptadores/adaptador_biblioteca.dart';
import 'package:flutter_application_1/Dominio/entidades/libro.dart';
import 'package:flutter_application_1/Dominio/entidades/movimiento.dart';
import 'package:flutter_application_1/Dominio/entidades/usuario.dart';
import 'package:flutter_application_1/Dominio/repositorios/repositorios_biblioteca.dart';

class RegistrarRetiroPage extends StatefulWidget {
  const RegistrarRetiroPage({super.key});

  @override
  State<RegistrarRetiroPage> createState() => _RegistrarRetiroPageState();
}

class _RegistrarRetiroPageState extends State<RegistrarRetiroPage> {
  int indexUsuarioSeleccionado = -1;
  int indexLibroSeleccionado = -1;

  void regitrarRetiro() {
    AdaptadorBibliotecaMemoria adaptador = AdaptadorBibliotecaMemoria();
    AdministracionDeBiblioteca admins =
        AdministracionDeBiblioteca(repositorio: adaptador);

    DateTime fecha = DateTime.now();
    Usuario usuario = adaptador.listaDeUsuarios[indexUsuarioSeleccionado];
    Libro libro = adaptador.listaDelibros[indexLibroSeleccionado];

    admins.registrarEntregaDeLibro(fecha, libro, usuario);
  }

  // void seleccionar(String seleccion, int index) {
  //   switch (seleccion) {
  //     case "usuario":
  //       setState(() {
  //         if (index != indexUsuarioSeleccionado) {
  //           indexUsuarioSeleccionado = index;
  //         } else {
  //           indexUsuarioSeleccionado = -1;
  //         }
  //       });

  //     case "libro":
  //       setState(() {
  //         if (index != indexLibroSeleccionado) {
  //           indexLibroSeleccionado = index;
  //         } else {
  //           indexLibroSeleccionado = -1;
  //         }
  //       });
  //   }
  // }  intento fallido

  @override
  Widget build(BuildContext context) {
    AdaptadorBibliotecaMemoria adaptador = AdaptadorBibliotecaMemoria();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 71, 71, 71),
      appBar: AppBar(
        title: const Text("Registrar Retiro"),
        centerTitle: true,
      ),
      body: Row(
        children: [
          Container(
            width: 300,
            color: const Color.fromARGB(255, 71, 71, 71),
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Text("Usuarios a retirar",
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.separated(
                    itemCount: adaptador.listaDeUsuarios.length,
                    itemBuilder: (BuildContext context, int index) {
                      Usuario user = adaptador.listaDeUsuarios[index];
                      return SizedBox(
                        height: 100,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: index == indexUsuarioSeleccionado
                                  ? Colors.red
                                  : const Color.fromARGB(255, 134, 134, 134),
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero)),
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
                                color: Colors.white, fontSize: 15),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 5),
          Container(
            width: 300,
            color: const Color.fromARGB(255, 71, 71, 71),
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Text("Libros a retirar",
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.separated(
                    itemCount: adaptador.listaDelibros.length,
                    itemBuilder: (BuildContext context, int index) {
                      Libro libro = adaptador.listaDelibros[index];
                      return SizedBox(
                        height: 100,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: index == indexLibroSeleccionado
                                  ? Colors.red
                                  : const Color.fromARGB(255, 134, 134, 134),
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero)),
                          onPressed: () {
                            setState(() {
                              if (index != indexLibroSeleccionado) {
                                indexLibroSeleccionado = index;
                              } else {
                                indexLibroSeleccionado = -1;
                              }
                            });
                          },
                          child: Text(
                            libro.nombre,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 15),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Center(
              child: SizedBox(
                height: 50,
                width: 400,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero)),
                  onPressed: regitrarRetiro,
                  child: const Text(
                    "REGISTRAR",
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
