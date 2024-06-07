import 'package:flutter_application_1/Dominio/data/adaptadores/adaptador_biblioteca.dart';
import 'package:flutter_application_1/Dominio/entidades/libro.dart';
import 'package:flutter_application_1/Dominio/entidades/movimiento.dart';
import 'package:flutter_application_1/Dominio/entidades/usuario.dart';

class AdministracionDeBiblioteca {
  AdaptadorBibliotecaMemoria adaptadorMemoria = AdaptadorBibliotecaMemoria();
  AdministracionDeBiblioteca({required this.adaptadorMemoria});

  void registrarEntregaDeLibro(DateTime fecha, Libro libro, Usuario usuario) {
    List<Libro> libros = adaptadorMemoria.listaDelibros;
    for (int i = 0; i < libros.length; i++) {
      if (libros[i].nombre == libro.nombre) {
        adaptadorMemoria.listaDelibros[i].disponible = false;
      }
    }

    MovimientoDeBiblioteca nuevoMovimiento =
        MovimientoDeBiblioteca(fecha, usuario, libro, false);

    adaptadorMemoria.agregarMovimiento(nuevoMovimiento);
  }

  void registrarDevolucionDeLibro(
      DateTime fecha, Libro libro, Usuario usuario) {
    List<Libro> libros = adaptadorMemoria.listaDelibros;
    for (int i = 0; i < libros.length; i++) {
      if (libros[i].nombre == libro.nombre) {
        adaptadorMemoria.listaDelibros[i].disponible = true;
      }
    }

    MovimientoDeBiblioteca newMovimiento =
        MovimientoDeBiblioteca(fecha, usuario, libro, true);

    adaptadorMemoria.agregarMovimiento(newMovimiento);
  }
}
