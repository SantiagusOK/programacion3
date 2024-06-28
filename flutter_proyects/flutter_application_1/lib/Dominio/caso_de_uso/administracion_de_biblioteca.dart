import 'package:flutter_application_1/Dominio/caso_de_uso/data/adaptadores/adaptador_biblioteca_firebase.dart';
import 'package:flutter_application_1/Dominio/entidades/libro.dart';
import 'package:flutter_application_1/Dominio/entidades/movimiento.dart';
import 'package:flutter_application_1/Dominio/entidades/usuario.dart';

class AdministracionDeBiblioteca {
  AdaptadorBibliotecaFirebase adaptadorFirebase = AdaptadorBibliotecaFirebase();
  AdministracionDeBiblioteca({required this.adaptadorFirebase});

  void registrarEntregaDeLibro(
      DateTime fecha, Libro libro, Usuario usuario) async {
    List<Libro> listaLibro = await adaptadorFirebase.todosLosLibros();

    for (int i = 0; i < listaLibro.length; i++) {
      if (listaLibro[i].nombre == libro.nombre) {
        // hacer que cambie de valor disponible a false en la DB
        //lista.listaDelibros[i].disponible = false;
        print("hola");
      }
    }

    MovimientoDeBiblioteca nuevoMovimiento =
        MovimientoDeBiblioteca(fecha, usuario, libro, false);

    adaptadorFirebase.agregarMovimiento(nuevoMovimiento);
  }

  void registrarDevolucionDeLibro(
      DateTime fecha, Libro libro, Usuario usuario) async {
    List<Libro> listaLibro = await adaptadorFirebase.todosLosLibros();

    for (int i = 0; i < listaLibro.length; i++) {
      if (listaLibro[i].nombre == libro.nombre) {
        adaptadorMemoria.listaDelibros[i].disponible = true;
      }
    }

    MovimientoDeBiblioteca newMovimiento =
        MovimientoDeBiblioteca(fecha, usuario, libro, true);

    adaptadorMemoria.agregarMovimiento(newMovimiento);
    print("object");
  }
}
