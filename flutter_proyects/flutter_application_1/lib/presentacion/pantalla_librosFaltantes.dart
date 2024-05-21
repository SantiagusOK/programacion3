import 'package:flutter/material.dart';
import 'package:flutter_application_1/Dominio/data/adaptadores/adaptador_biblioteca.dart';
import 'package:flutter_application_1/Dominio/entidades/libro.dart';

class LibrosFaltantesPage extends StatelessWidget {
  const LibrosFaltantesPage({super.key});
  @override
  Widget build(BuildContext context) {
    AdaptadorBibliotecaMemoria adaptador = AdaptadorBibliotecaMemoria();

    List<Libro> librosLista = adaptador.todosLosLibrosNoVueltos();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 58, 58, 58),
      appBar: AppBar(title: const Text("Libros faltantes"), centerTitle: true),
      body: Center(
        child: SizedBox(
            width: 500,
            child: librosLista.isNotEmpty
                ? widgetListaBuild(adaptador)
                : textNofaltanLibros()),
      ),
    );
  }

  ListView widgetListaBuild(AdaptadorBibliotecaMemoria adaptador) {
    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemCount: adaptador.todosLosLibrosNoVueltos().length,
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemBuilder: (BuildContext context, int index) {
        Libro libroFaltante = adaptador.todosLosLibrosNoVueltos()[index];
        return Column(
          children: [
            contaierLibrosFaltantes(libroFaltante),
          ],
        );
      },
    );
  }

  Container contaierLibrosFaltantes(Libro libro) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromARGB(255, 85, 85, 85),
      ),
      child: Center(
        child: Text(
          libro.nombre,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }

  Widget textNofaltanLibros() {
    return const Center(
        child: Text(
      "No faltan libros",
      style: TextStyle(fontSize: 30, color: Colors.white),
    ));
  }
}
