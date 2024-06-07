import 'package:flutter/material.dart';
import 'package:flutter_application_1/Dominio/data/adaptadores.dart';
import 'package:flutter_application_1/Dominio/entidades/movimiento.dart';

class PageMovimientos extends StatelessWidget {
  const PageMovimientos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movimientos"),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Center(
          child: adaptadorMemoria.listaDeMovimientos.isNotEmpty
              ? sizeboxListview()
              : textoMov("No hay movimientos")),
    );
  }

  SizedBox sizeboxListview() {
    return SizedBox(
      width: 800,
      child: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: adaptadorMemoria.listaDeMovimientos.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemBuilder: (BuildContext context, int index) {
          MovimientoDeBiblioteca mov =
              adaptadorMemoria.listaDeMovimientos[index];
          return containerMovimiento(mov);
        },
      ),
    );
  }

  Container containerMovimiento(MovimientoDeBiblioteca mov) {
    return Container(
      color: Colors.grey,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            textoMov("Fecha: ${mov.fecha.toString()}"),
            const SizedBox(height: 10),
            textoMov(
                "Nombre y Apellido: ${mov.usuario.nombre}  ${mov.usuario.apellido}"),
            const SizedBox(height: 10),
            textoMov("Libro: ${mov.libro.nombre}"),
            const SizedBox(height: 10),
            textoMov("Es Devolucion: ${mov.esDevolucion ? "Si" : "No"}"),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Text textoMov(String dato) {
    return Text(
      dato,
      style: const TextStyle(color: Colors.white, fontSize: 30),
    );
  }
}
