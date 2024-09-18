import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_block/ejbloc.dart';
import 'package:test_block/stateblock.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (_) => BlocLibros(),
        child: const Pagina(),
      ),
    );
  }
}

class Pagina extends StatelessWidget {
  const Pagina({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nombreController = TextEditingController();

    return BlocBuilder<BlocLibros, EstadoLibro>(
      builder: (context, state) {
        if (state is MostrandoLibro) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 300,
                        child: TextField(
                          controller: nombreController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text("CREAR"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    color: Colors.red,
                    width: 500,
                    height: 500,
                    child: ListView.builder(
                      itemCount: state.listaLibros.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(title: Text(state.listaLibros[index]));
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
