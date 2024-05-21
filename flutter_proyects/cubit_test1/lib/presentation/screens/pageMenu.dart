import 'package:cubit_test1/presentation/bloc/cubit_username.dart';
import 'package:cubit_test1/presentation/bloc/userState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PaginaMenu extends StatelessWidget {
  const PaginaMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, Userstate>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () => context.go("/lista"),
                    child: const Text("Lista de usuarios")),
                ElevatedButton(
                  onPressed: () {
                    state.listaUsuarios.clear();
                  },
                  child: const Text("Limpiar lista"),
                ),
                ElevatedButton(
                    onPressed: () => context.go("/crear"),
                    child: const Text("Agregar Usuario")),
              ],
            ),
          ),
        );
      },
    );
  }
}
