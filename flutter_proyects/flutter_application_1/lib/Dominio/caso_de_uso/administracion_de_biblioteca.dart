import 'package:flutter_application_1/Dominio/data/adaptadores/adaptador_biblioteca.dart';
import 'package:flutter_application_1/Dominio/entidades/libro.dart';
import 'package:flutter_application_1/Dominio/entidades/movimiento.dart';
import 'package:flutter_application_1/Dominio/entidades/usuario.dart';

class AdministracionDeBiblioteca {
  AdaptadorBibliotecaMemoria adaptadorMemoria = AdaptadorBibliotecaMemoria();
  AdministracionDeBiblioteca({required this.adaptadorMemoria});

  void registrarEntregaDeLibro(DateTime fecha, Libro libro, Usuario usuario) {
    MovimientoDeBiblioteca nuevoMovimiento =
        MovimientoDeBiblioteca(fecha, usuario, libro, false);
    adaptadorMemoria.agregarMovimiento(nuevoMovimiento);
  }

  void registrarDevolucionDeLibro(
      DateTime fecha, Libro libro, Usuario usuario) {
    MovimientoDeBiblioteca newMovimiento =
        MovimientoDeBiblioteca(fecha, usuario, libro, true);
    adaptadorMemoria.agregarMovimiento(newMovimiento);
  }
}
