import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Dominio/data/adaptadores.dart';
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

    await coleccion.add(libro);
  }

  @override
  void agregarMovimiento(MovimientoDeBiblioteca nuevoMovimiento) {
    // TODO: implement agregarMovimiento
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
  void todosLosLibrosNoVueltos() {
    // TODO: implement todosLosLibrosNoVueltos
  }

  @override
  List<Libro> todosLosLibros() {
    List<Libro> listaLibrosFirebase = [];

    coleccion.get().then(
      (QuerySnapshot querySnapshot) {
        for (DocumentSnapshot documento in querySnapshot.docs) {
          Libro libro = Libro(
              documento["id"], documento["nombre"], documento["disponible"]);

          listaLibrosFirebase.add(libro);
        }
      },
    );

    return listaLibrosFirebase;
  }

  @override
  List<Usuario> todosLosUsuarios() {
    // TODO: implement todosLosUsuarios
    throw UnimplementedError();
  }
}
