import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
    final TextEditingController textName = TextEditingController();
    String url = "http://127.0.0.1:8000/user/new";
    Future<Response>? respuesta;
    void aceptar() {
      Map<String, String> headers = {"Content-type": "application/json"};
      String body = json.encode({"name": textName.value.text});
      respuesta = post(Uri.parse(url), body: body, headers: headers);
    }
  @override
  Widget build(BuildContext context) {


    Text nombre() {
      return FutureBuilder(
        future: Future,
        initialData: InitialData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return ;
        },
      ),
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Flutter + FastAPi Test1",
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("ESCRIBE UN NOMBRE"),
            SizedBox(
              width: 500,
              child: TextField(
                controller: textName,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(onPressed: () {}, child: const Text("Aceptar")),
            nombre()
          ],
        ),
      ),
    );
  }
}
