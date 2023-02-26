import 'package:flutter/material.dart';
import 'package:videogame_rater/FileManager/file_manager_service.dart';
import 'package:videogame_rater/screens/credit_screen.dart';
import 'package:videogame_rater/screens/nav_drawer.dart';
import 'package:videogame_rater/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video game rater',
      // Aqui indicamos las rutas a las que debe dirigir nuestro menu navegable lateral
      initialRoute: "/",
      routes: {
        "/": (context) => const MyHomePage(),
        "/videojuegos": (context) => const HomeScreen(),
        "/creditos": (context) => const CreditScreen()
      },
      // Aqui indicamos el tema, para que sea algo más agradable
      theme:
          ThemeData(primarySwatch: Colors.indigo, brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    FileManagerService().leerJsonData();
    return Scaffold(
        //Aqui aplicamos el drawer lateral para navegar la aplicacion
        drawer: const NavDrawer(),
        //La appbar es la barra superior donde figura el titulo de nuestra aplicacion
        appBar: AppBar(
          title: const Text('Bienvenida'),
        ),
        body: const Center(
          child: Padding(
            padding: EdgeInsets.all(30.0),
            child: Text(
                'Bienvenido al proyecto final de Suhail Matrouch Mohamed, la aplicación para calificar videojuegos',
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 25,
                    fontStyle: FontStyle.italic)),
          ),
        ));
  }
}
