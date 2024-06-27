import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/Dominio/caso_de_uso/data/adaptadores.dart';
import 'package:flutter_application_1/Dominio/entidades/libro.dart';
import 'package:flutter_application_1/Dominio/entidades/movimiento.dart';
import 'package:flutter_application_1/Dominio/entidades/usuario.dart';
import 'package:flutter_application_1/Dominio/repositorios/repositorios_biblioteca.dart';

class AdaptadorBibliotecaFirebase implements RepositorioBiblioteca {
  @override
  void agregarLibro(Libro nuevoLibro) async {
    Map<String, dynamic> libro = {
      "id": nuevoLibro.id,
      "nombre": nuevoLibro.nombre,
      "disponible": nuevoLibro.disponible
    };

    await coleccionLibros.add(libro);
    //await coleccionLibros.doc().g
  }

  @override
  Future<List<Libro>> todosLosLibros() async {
    // List librosFirebase = [];

    //QuerySnapshot querySnapshot = await coleccionLibros.get();

    return (await coleccionLibros.get())
        .docs
        .map((element) => element.data() as Map<String, dynamic>)
        .map((dict) => Libro(dict["id"], dict["nombre"], dict["disponible"]))
        .toList();
    // for (var element in querySnapshot.docs) {
    //   Map<String, dynamic> datos = element.data() as Map<String, dynamic>;
    //   Libro libro = Libro(
    //     datos["id"],
    //     datos["nombre"],
    //     datos["disponible"],
    //   );
    //   librosFirebase.add(libro);
    //   //print(datos);
    // }
    // return librosFirebase;
  }

  @override
  Future<List<Libro>> todosLosLibrosNoVueltos() async {
    List<Libro> librosNoVueltosFirebase = [];

    QuerySnapshot querySnapshot = await coleccionLibros.get();

    querySnapshot.docs.forEach((element) {
      Map<String, dynamic> documento = element.data() as Map<String, dynamic>;

      Libro libro = Libro(
        documento["id"],
        documento["nombre"],
        documento["disponible"],
      );
      if (!libro.disponible) {
        librosNoVueltosFirebase.add(libro);
      }
    });

    return librosNoVueltosFirebase;
  }

  @override
  void agregarMovimiento(MovimientoDeBiblioteca nuevoMovimiento) async {
    Map<String, dynamic> MovData = {
      "fecha": nuevoMovimiento.fecha,
      "usuario": nuevoMovimiento.usuario,
      "libro": nuevoMovimiento.libro,
      "esDevolucion": nuevoMovimiento.esDevolucion
    };

    await coleccionMovimiento.add(MovData);
  }

  @override
  void agregarUsuario(Usuario nuevoUsuario) async {
    Map<String, dynamic> usuarioData = {
      "dni": nuevoUsuario.dni,
      "nombre": nuevoUsuario.nombre,
      "apellido": nuevoUsuario.apellido,
      "telefono": nuevoUsuario.telefono,
      "email": nuevoUsuario.email
    };

    await coleccionUser.add(usuarioData);
  }

  @override
  Future<List<Usuario>> todosLosUsuarios() async {
    List<Usuario> listaUsuarioFirebase = [];

    QuerySnapshot querySnapshot = await coleccionUser.get();

    querySnapshot.docs.forEach(
      (element) {
        Map<String, dynamic> documento = element.data() as Map<String, dynamic>;

        Usuario usuario = Usuario(
          documento["dni"],
          documento["nombre"],
          documento["apellido"],
          documento["telefono"],
          documento["email"],
        );

        listaUsuarioFirebase.add(usuario);
      },
    );

    return listaUsuarioFirebase;
  }
}
