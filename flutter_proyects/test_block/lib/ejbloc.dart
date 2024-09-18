import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_block/eventblock.dart';
import 'package:test_block/stateblock.dart';

class BlocLibros extends Bloc<EventoLibro, EstadoLibro> {
  List<String> listaLibros = [];
  BlocLibros() : super(MostrandoLibro([])) {
    on<AgregarLibro>(_crearLibro);
  }
  _crearLibro(AgregarLibro event, Emitter<EstadoLibro> emit) {
    listaLibros.add(event.nombre);
    emit(MostrandoLibro(listaLibros));
  }
}
