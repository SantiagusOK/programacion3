import 'package:flutter/material.dart';
import 'package:flutter_application_1/Dominio/entidades/libro.dart';
import 'package:flutter_application_1/Dominio/entidades/movimiento.dart';
import 'package:flutter_application_1/Dominio/entidades/usuario.dart';

abstract class RepositorioBiblioteca{

  List<Libro> listaDelibros = [];
  List<Usuario> listaDeUsuarios = [];
  List<MovimientoDeBiblioteca> listaDeMovimientos = [];


  void agregarLibro(Libro nuevoLibro){
    listaDelibros.add(nuevoLibro);
  }

  void agregarUsuario(Usuario nuevoUsuario){
    listaDeUsuarios.add(nuevoUsuario);
  }

  List<Libro> todosLosLibros(){
    return listaDelibros;
  } 

  List<Usuario> todosLosUsuarios(){
    return listaDeUsuarios;
  } 

  void agregarMovimiento(MovimientoDeBiblioteca nuevoMovimiento){
    listaDeMovimientos.add(nuevoMovimiento);
  }

  void todosLosLibrosNoVueltos(){} // List<Libro>

}