// ignore_for_file: file_names
import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(padding: EdgeInsets.zero, children: <Widget>[
      const DrawerHeader(
          child: Text(
        'Editor',
        style: TextStyle(color: Colors.blueAccent, fontSize: 25),
      )),
      ListTile(
        leading: const Icon(Icons.home),
        title: const Text('Bienvenida'),
        onTap: () => {Navigator.pushNamed(context, "/")},
      ),
      ListTile(
        leading: const Icon(Icons.android_rounded),
        title: const Text('Pantalla principal de la app'),
        onTap: () => {Navigator.pushNamed(context, "/videojuegos")},
      ),
      ListTile(
        leading: const Icon(Icons.account_circle),
        title: const Text('Perfil'),
        onTap: () => {Navigator.pushNamed(context, "/perfil")},
      ),
    ]));
  }
}
