import 'package:flutter/material.dart';

import 'package:videogame_rater/screens/nav_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
