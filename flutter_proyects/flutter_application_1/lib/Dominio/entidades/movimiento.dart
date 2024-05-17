import 'package:flutter_application_1/Dominio/entidades/libro.dart';
import 'package:flutter_application_1/Dominio/entidades/usuario.dart';

class MovimientoDeBiblioteca {
  DateTime fecha;
  Usuario usuario;
  Libro libro;
  bool esDevolucion;

  MovimientoDeBiblioteca(
      this.fecha, this.usuario, this.libro, this.esDevolucion);
}
