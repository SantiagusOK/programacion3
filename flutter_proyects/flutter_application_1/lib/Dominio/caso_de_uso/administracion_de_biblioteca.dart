import 'package:flutter_application_1/Dominio/entidades/libro.dart';
import 'package:flutter_application_1/Dominio/entidades/movimiento.dart';
import 'package:flutter_application_1/Dominio/entidades/usuario.dart';
import 'package:flutter_application_1/Dominio/repositorios/repositorios_biblioteca.dart';

class AdministracionDeBiblioteca {
  RepositorioBiblioteca repositorio;
  AdministracionDeBiblioteca({required this.repositorio});

  void registrarEntregaDeLibro(DateTime fecha, Libro libro, Usuario usuario) {
    MovimientoDeBiblioteca nuevoMovimiento =
        MovimientoDeBiblioteca(fecha, usuario, libro, false);
    repositorio.agregarMovimiento(nuevoMovimiento);
  }

  void registrarDevolucionDeLibro(
      DateTime fecha, Libro libro, Usuario usuario) {
    MovimientoDeBiblioteca newMovimiento =
        MovimientoDeBiblioteca(fecha, usuario, libro, true);
    repositorio.agregarMovimiento(newMovimiento);
  }
}
