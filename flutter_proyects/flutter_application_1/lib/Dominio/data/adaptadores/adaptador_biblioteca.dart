import 'package:flutter_application_1/Dominio/entidades/libro.dart';
import 'package:flutter_application_1/Dominio/entidades/movimiento.dart';
import 'package:flutter_application_1/Dominio/entidades/usuario.dart';
import 'package:flutter_application_1/Dominio/repositorios/repositorios_biblioteca.dart';

class AdaptadorBibliotecaMemoria implements RepositorioBiblioteca {
  List<Libro> listaDelibros = [
    Libro(1, "El Principito", true),
    Libro(2, "Virtual Hero", true),
    Libro(3, "Luna de Pluton", true),
    Libro(4, "El libro Troll", true),
    Libro(5, "Chupa el perro: El Libro", false),
  ];
  List<Usuario> listaDeUsuarios = [
    Usuario(44404561, "Santiago", "Zapata", 2622785490, "santi315@gmail.com"),
    Usuario(44404561, "Santiago", "Zapata", 2622785490, "santi315@gmail.com"),
    Usuario(44404561, "Santiago", "Zapata", 2622785490, "santi315@gmail.com"),
    Usuario(44404561, "Santiago", "Zapata", 2622785490, "santi315@gmail.com"),
  ];
  List<MovimientoDeBiblioteca> listaDeMovimientos = [];

  @override
  void agregarLibro(Libro nuevoLibro) {
    listaDelibros.add(nuevoLibro);
  }

  @override
  void agregarUsuario(Usuario nuevoUsuario) {
    listaDeUsuarios.add(nuevoUsuario);
  }

  @override
  List<Libro> todosLosLibros() {
    return listaDelibros;
  }

  @override
  List<Usuario> todosLosUsuarios() {
    return listaDeUsuarios;
  }

  @override
  void agregarMovimiento(MovimientoDeBiblioteca nuevoMovimiento) {
    listaDeMovimientos.add(nuevoMovimiento);
  }

  @override
  void todosLosLibrosNoVueltos() {} // List<Libro>
}
