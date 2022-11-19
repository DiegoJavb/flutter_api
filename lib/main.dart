import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'models/gif.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<List<Gif>> _listadoGifs;

  Future<List<Gif>> _getGifs() async {
    List<Gif> gifs = [];
    final response = await http.get(
      Uri.parse(
        'https://api.giphy.com/v1/gifs/search?api_key=kKhAP4GBLm3la9xpbEuhjff8nV6SnAfs&q=croods&limit=20&offset=0&rating=g&lang=en',
      ),
    );
    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      final data = jsonDecode(body);
      for (var item in data['data']) {
        gifs.add(
            Gif(name: item['title'], url: item['images']['downsized']['url']));
      }
    } else {
      throw Exception('Fallo al cargar los gifs');
    }
    return gifs;
  }

  @override
  void initState() {
    super.initState();
    _listadoGifs = _getGifs();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: FutureBuilder(
          future: _listadoGifs,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.count(
                crossAxisCount: 2,
                children: _listGifs(snapshot.data),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            } else {
              return Text('Cargando...');
            }
          },
        ),
      ),
    );
  }

  List<Widget> _listGifs(data) {
    List<Widget> gifs = [];
    for (var gif in data) {
      gifs.add(
        Card(
          child: Column(
            children: [
              Expanded(
                child: Image(
                  image: NetworkImage(gif.url),
                ),
              ),
            ],
          ),
        ),
      );
    }
    return gifs;
  }
}






// VIDEO 2 LISTAS
// import 'package:flutter/material.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   List<Persona> _personas = [
//     Persona('Juan', 'Carlos', '+546 4554-4'),
//     Persona('Pedro', 'Perez', '+546 4554-4'),
//     Persona('Maria', 'Gomez', '+546 4554-4'),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Flutter Demo Home Page'),
//         ),
//         // LIST VIEW BUILDER SE UTILIA SI SE CONSTRUYE A PARTIR DE UNA VARIABLE
//         body: ListView.builder(
//           itemCount: _personas.length,
//           itemBuilder: (context, index) {
//             return ListTile(
//               onTap: () {
//                 this._borrarPersona(context, _personas[index]);
//               },
//               title:
//                   Text(_personas[index].name + ' ' + _personas[index].lastname),
//               subtitle: Text(_personas[index].phone),
//               leading: CircleAvatar(
//                 child: Text(_personas[index].name[0]),
//               ),
//               trailing: Icon(Icons.arrow_forward_ios),
//             );
//           },
//         ),
//       ),
//     );
//   }

//   _borrarPersona(context, Persona persona) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Borrar ${persona.name}'),
//           content: Text('¿Estas seguro de borrar a ${persona.name}?'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('Cancelar'),
//             ),
//             TextButton(
//               onPressed: () {
//                 setState(() {
//                   _personas.remove(persona);
//                 });
//                 Navigator.of(context).pop();
//               },
//               child: Text('Aceptar'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

// class Persona {
//   late String name;
//   late String lastname;
//   late String phone;

//   Persona(name, lastname, phone) {
//     this.name = name;
//     this.lastname = lastname;
//     this.phone = phone;
//   }
// }


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
