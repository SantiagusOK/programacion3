import 'package:flutter_application_1/Dominio/entidades/libro.dart';
import 'package:flutter_application_1/Dominio/entidades/movimiento.dart';
import 'package:flutter_application_1/Dominio/entidades/usuario.dart';
import 'package:flutter_application_1/Dominio/repositorios/repositorios_biblioteca.dart';

class AdaptadorBibliotecaFirebase implements RepositorioBiblioteca {
  @override
  void agregarLibro(Libro nuevoLibro) {
    // TODO: implement agregarLibro
  }

  @override
  void agregarMovimiento(MovimientoDeBiblioteca nuevoMovimiento) {
    // TODO: implement agregarMovimiento
  }

  @override
  void agregarUsuario(Usuario nuevoUsuario) {
    // TODO: implement agregarUsuario
  }

  @override
  List<Libro> todosLosLibros() {
    // TODO: implement todosLosLibros
    throw UnimplementedError();
  }

  @override
  void todosLosLibrosNoVueltos() {
    // TODO: implement todosLosLibrosNoVueltos
  }

  @override
  List<Usuario> todosLosUsuarios() {
    // TODO: implement todosLosUsuarios
    throw UnimplementedError();
  }
}
