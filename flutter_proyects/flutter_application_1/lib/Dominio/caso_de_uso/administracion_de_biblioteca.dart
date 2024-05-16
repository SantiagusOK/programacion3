import 'package:flutter/material.dart';
import 'package:flutter_application_1/Dominio/entidades/libro.dart';
import 'package:flutter_application_1/Dominio/entidades/movimiento.dart';
import 'package:flutter_application_1/Dominio/entidades/usuario.dart';
import 'package:flutter_application_1/Dominio/repositorios/repositorios_biblioteca.dart';


class AdministracionDeBiblioteca{
  RepositorioBiblioteca repositorioBiblioteca;
  AdministracionDeBiblioteca({required this.repositorioBiblioteca});

  void registrarEntregaDeLibro(DateTime fecha, Libro libro, Usuario usuario){
    MovimientoDeBiblioteca newMovimiento = MovimientoDeBiblioteca(fecha, usuario, libro, false);
    repositorioBiblioteca.agregarMovimiento(newMovimiento);
  }
  
  void registrarDevolucionDeLibro(DateTime fecha, Libro libro, Usuario usuario){
    MovimientoDeBiblioteca newMovimiento = MovimientoDeBiblioteca(fecha, usuario, libro, true);
    repositorioBiblioteca.agregarMovimiento(newMovimiento);
  }
}