import 'package:cubit_test1/presentation/bloc/userState.dart';
import 'package:cubit_test1/presentation/bloc/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<Userstate> {
  UserCubit()
      : super(Userstate(listaUsuarios: [
          User(name: "Santiago", age: 12),
          User(name: "Santiago", age: 12),
          User(name: "Santiago", age: 12),
        ]));

  void actualizarDatos(User newUser) {
    List<User> updatedList = state.listaUsuarios;
    updatedList.add(newUser);
    emit(Userstate(listaUsuarios: updatedList));
  }
}
