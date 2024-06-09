import 'package:flutter_application_1/Dominio/entidades/libro.dart';
import 'package:flutter_application_1/Dominio/entidades/movimiento.dart';
import 'package:flutter_application_1/Dominio/entidades/usuario.dart';

abstract class RepositorioBiblioteca {
  void agregarLibro(Libro nuevoLibro);

  void agregarUsuario(Usuario nuevoUsuario);

  List<Libro> todosLosLibros();

  Future<List> todosLosLibrosFirebase();

  List<Usuario> todosLosUsuarios();

  Future<List> todosLosUsuariosFirebase();

  void agregarMovimiento(MovimientoDeBiblioteca nuevoMovimiento);

  void todosLosLibrosNoVueltos();

  Future<List> todosLosLibrosNoVueltosFirebase(); // List<Libro>
}
