import 'package:flutter_application_1/Dominio/entidades/libro.dart';
import 'package:flutter_application_1/Dominio/entidades/movimiento.dart';
import 'package:flutter_application_1/Dominio/entidades/usuario.dart';

abstract class RepositorioBiblioteca {
  void agregarLibro(Libro nuevoLibro);

  void agregarUsuario(Usuario nuevoUsuario);

  List<Libro> todosLosLibros();

  List<Usuario> todosLosUsuarios();

  void agregarMovimiento(MovimientoDeBiblioteca nuevoMovimiento);

  void todosLosLibrosNoVueltos(); // List<Libro>
}
