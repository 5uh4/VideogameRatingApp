import 'package:flutter/material.dart';
import 'package:videogame_rater/screens/NavDrawer.dart';
import 'package:videogame_rater/screens/Perfil.dart';
import 'package:videogame_rater/screens/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Video game rater',
      initialRoute: "/",
      routes: {
        "/": (context) => const MyHomePage(),
        "/videojuegos": (context) => const HomeScreen(),
        "/perfil": (context) => const PerfilPersonal()
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
                style: TextStyle(fontFamily: 'Roboto')),
          ),
        ));
  }
}
