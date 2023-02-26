import 'package:flutter/material.dart';
import 'package:videogame_rater/FileManager/file_manager_service.dart';
import 'package:videogame_rater/screens/nav_drawer.dart';
import 'package:videogame_rater/screens/search_screen.dart';
import 'package:videogame_rater/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Video game rater',
      initialRoute: "/",
      routes: {
        "/": (context) => const MyHomePage(),
        "/videojuegos": (context) => const HomeScreen(),
        "/busqueda": (context) => const SearchScreen(
              juegos: [],
            )
      },
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    FileManagerService().leerJsonData();
    return Scaffold(
        drawer: const NavDrawer(),
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
