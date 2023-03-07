import 'package:flutter/material.dart';
import 'package:videogame_rater/auth_controller.dart';

import 'package:videogame_rater/screens/nav_drawer.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({
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
          actions: [
            IconButton(
                onPressed: () {
                  AuthController.instance.logout();
                },
                icon: const Icon(Icons.logout_outlined))
          ],
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
