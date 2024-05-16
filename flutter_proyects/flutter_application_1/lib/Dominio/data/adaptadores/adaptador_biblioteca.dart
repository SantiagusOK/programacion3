import 'package:flutter_application_1/Dominio/entidades/libro.dart';
import 'package:flutter_application_1/Dominio/entidades/movimiento.dart';
import 'package:flutter_application_1/Dominio/entidades/usuario.dart';
import 'package:flutter_application_1/Dominio/repositorios/repositorios_biblioteca.dart';

class AdaptadorBibliotecaMemoria implements RepositorioBiblioteca{

  List<Libro> listaDelibros = [];
  List<Usuario> listaDeUsuarios = [];
  List<MovimientoDeBiblioteca> listaDeMovimientos = [];

  @override
  void agregarLibro(Libro nuevoLibro){
    listaDelibros.add(nuevoLibro);
  }
  
  @override
  void agregarUsuario(Usuario nuevoUsuario){
    listaDeUsuarios.add(nuevoUsuario);
  }

  @override
  List<Libro> todosLosLibros(){
    return listaDelibros;
  } 

  @override
  List<Usuario> todosLosUsuarios(){
    return listaDeUsuarios;
  } 

  @override
  void agregarMovimiento(MovimientoDeBiblioteca nuevoMovimiento){
    listaDeMovimientos.add(nuevoMovimiento);
  }

  @override
  void todosLosLibrosNoVueltos(){} // List<Libro>




}