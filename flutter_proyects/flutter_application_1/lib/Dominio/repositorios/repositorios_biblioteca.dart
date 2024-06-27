import 'package:flutter_application_1/Dominio/entidades/libro.dart';
import 'package:flutter_application_1/Dominio/entidades/movimiento.dart';
import 'package:flutter_application_1/Dominio/entidades/usuario.dart';

abstract class RepositorioBiblioteca {
  void agregarLibro(Libro nuevoLibro);

  void agregarUsuario(Usuario nuevoUsuario);

  Future<List<Libro>> todosLosLibros();

  Future<List<Usuario>> todosLosUsuarios();

  void agregarMovimiento(MovimientoDeBiblioteca nuevoMovimiento);

  Future<List<Libro>> todosLosLibrosNoVueltos(); // List<Libro>
}
