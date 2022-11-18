import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Persona> _personas = [
    Persona('Juan', 'Carlos', '+546 4554-4'),
    Persona('Pedro', 'Perez', '+546 4554-4'),
    Persona('Maria', 'Gomez', '+546 4554-4'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Demo Home Page'),
        ),
        // LIST VIEW BUILDER SE UTILIA SI SE CONSTRUYE A PARTIR DE UNA VARIABLE
        body: ListView.builder(
          itemCount: _personas.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                this._borrarPersona(context, _personas[index]);
              },
              title:
                  Text(_personas[index].name + ' ' + _personas[index].lastname),
              subtitle: Text(_personas[index].phone),
              leading: CircleAvatar(
                child: Text(_personas[index].name[0]),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            );
          },
        ),
      ),
    );
  }

  _borrarPersona(context, Persona persona) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Borrar ${persona.name}'),
          content: Text('¿Estas seguro de borrar a ${persona.name}?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _personas.remove(persona);
                });
                Navigator.of(context).pop();
              },
              child: Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }
}

class Persona {
  late String name;
  late String lastname;
  late String phone;

  Persona(name, lastname, phone) {
    this.name = name;
    this.lastname = lastname;
    this.phone = phone;
  }
}


// VIDEO 1 CLASES
// import 'package:flutter/material.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   // el guion bajo significa que es una variable local
//   Empresa _facebook = Empresa('facebook', 'Mark Zuckerberg', 2004);
//   Empresa _google = Empresa('google', 'Larry Page', 1998);
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     print(_facebook.nombre);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Material App',
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Classes'),
//         ),
//         body: Center(
//           child: Text(_facebook.nombre),
//         ),
//       ),
//     );
//   }
// }

// class Empresa {
//   late String nombre;
//   late String propietario;
//   late int ingresoAnual;

//   Empresa(String nombre, String propietario, int ingresoAnual) {
//     this.nombre = nombre;
//     this.propietario = propietario;
//     this.ingresoAnual = ingresoAnual;
//   }
// }
