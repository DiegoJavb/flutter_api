import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // el guion bajo significa que es una variable local
  Empresa _facebook = Empresa('facebook', 'Mark Zuckerberg', 2004);
  Empresa _google = Empresa('google', 'Larry Page', 1998);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(_facebook.nombre);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Classes'),
        ),
        body: Center(
          child: Text(_facebook.nombre),
        ),
      ),
    );
  }
}

class Empresa {
  late String nombre;
  late String propietario;
  late int ingresoAnual;

  Empresa(String nombre, String propietario, int ingresoAnual) {
    this.nombre = nombre;
    this.propietario = propietario;
    this.ingresoAnual = ingresoAnual;
  }
}
