import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/Dominio/caso_de_uso/administracion_de_biblioteca.dart';
import 'package:flutter_application_1/Dominio/data/adaptadores/adaptador_biblioteca.dart';
import 'package:flutter_application_1/Dominio/data/adaptadores/adaptador_biblioteca_firebase.dart';

AdaptadorBibliotecaMemoria adaptadorMemoria = AdaptadorBibliotecaMemoria();

AdaptadorBibliotecaFirebase adaptadorFirebase = AdaptadorBibliotecaFirebase();

AdministracionDeBiblioteca adminsBiblioteca =
    AdministracionDeBiblioteca(adaptadorMemoria: adaptadorMemoria);

CollectionReference coleccion = FirebaseFirestore.instance.collection("Libros");
CollectionReference coleccionUser =
    FirebaseFirestore.instance.collection("Usuarios");
