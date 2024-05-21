import 'package:cubit_test1/presentation/bloc/cubit_username.dart';
import 'package:cubit_test1/presentation/screens/page1.dart';
import 'package:cubit_test1/presentation/screens/pageMenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => UserCubit(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: PaginaMenu(),
    );
  }
}
