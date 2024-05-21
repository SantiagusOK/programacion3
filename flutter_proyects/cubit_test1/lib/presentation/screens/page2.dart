import 'package:cubit_test1/presentation/bloc/cubit_username.dart';
import 'package:cubit_test1/presentation/bloc/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PaginaCrear extends StatelessWidget {
  const PaginaCrear({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controllName = TextEditingController();
    TextEditingController controllAge = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Agregar"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 500,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Nombre"),
                  TextField(
                    controller: controllName,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 500,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Edad"),
                  TextField(
                    controller: controllAge,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                User newUser = User(
                  name: controllName.text,
                  age: int.parse(controllAge.text),
                );
                context.read<UserCubit>().actualizarDatos(newUser);
              },
              child: const Text("guardar"),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go("/"),
        child: const Icon(Icons.arrow_back_ios_new),
      ),
    );
  }
}
