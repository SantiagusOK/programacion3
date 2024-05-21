import 'package:cubit_test1/presentation/bloc/cubit_username.dart';
import 'package:cubit_test1/presentation/bloc/userState.dart';
import 'package:cubit_test1/presentation/bloc/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
                  ? const Text("No hay nombres")
                  : listViewUsuario(state)),
          floatingActionButton: FloatingActionButton(
              onPressed: () => context.go("/"),
              child: const Icon(Icons.arrow_back_ios_new)),
        );
      },
    );
  }

  SizedBox listViewUsuario(Userstate state) {
    return SizedBox(
      width: 300,
      child: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: state.listaUsuarios.length,
        itemBuilder: (BuildContext context, int index) {
          User user = state.listaUsuarios[index];
          return Center(
              child: Text("${user.name}  -  ${user.age}",
                  style: const TextStyle(color: Colors.black, fontSize: 25)));
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
      ),
    );
  }
}
