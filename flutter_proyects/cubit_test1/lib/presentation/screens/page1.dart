import 'package:cubit_test1/presentation/bloc/cubit_username.dart';
import 'package:cubit_test1/presentation/bloc/userState.dart';
import 'package:cubit_test1/presentation/bloc/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaginaName extends StatelessWidget {
  const PaginaName({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, Userstate>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("CubitTest1"),
            centerTitle: true,
          ),
          body: Center(
            child: state.listaUsuarios.isEmpty
                ? Container(
                    child: Text("No hay nombres"),
                  )
                : ListView.builder(
                    itemCount: state.listaUsuarios.length,
                    itemBuilder: (BuildContext context, int index) {
                      User user = state.listaUsuarios[index];
                      return Text(
                        user.name,
                        style: const TextStyle(color: Colors.black),
                      );
                    },
                  ),
          ),
        );
      },
    );
  }
}
