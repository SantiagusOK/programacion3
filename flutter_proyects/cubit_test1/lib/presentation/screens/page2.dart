import 'package:cubit_test1/presentation/bloc/cubit_username.dart';
import 'package:cubit_test1/presentation/bloc/userState.dart';
import 'package:cubit_test1/presentation/bloc/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaginaCrear extends StatelessWidget {
  const PaginaCrear({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controllName = TextEditingController();
    TextEditingController controllAge = TextEditingController();

    return BlocBuilder<UserCubit, Userstate>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Agregar"),
          ),
          body: Center(
            child: Column(
              children: [
                SizedBox(
                  width: 500,
                  child: TextField(
                    controller: controllName,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  width: 500,
                  child: TextField(
                    controller: controllAge,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    User newUser = User(
                        name: controllName.text,
                        age: int.parse(controllAge.text));
                    context.read<UserCubit>().actualizarDatos(newUser);
                  },
                  child: const Text("guardar"),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
