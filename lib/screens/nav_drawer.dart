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
        'Navegación del programa',
        style: TextStyle(color: Colors.blueAccent, fontSize: 25),
      )),
      ListTile(
        leading: Icon(Icons.home, color: Colors.green.shade300),
        title: const Text('Bienvenida'),
        onTap: () => {Navigator.pushNamed(context, "/")},
      ),
      ListTile(
        leading: const Icon(Icons.list, color: Colors.lightBlue),
        title: const Text('Pantalla principal de la app'),
        onTap: () => {Navigator.pushNamed(context, "/videojuegos")},
      ),
      ListTile(
        leading: const Icon(Icons.search),
        title: const Text('Busqueda'),
        onTap: () => {Navigator.pushNamed(context, "/busqueda")},
      ),
      ListTile(
        leading: const Icon(Icons.account_circle, color: Colors.redAccent),
        title: const Text('Perfil'),
        onTap: () => {Navigator.pushNamed(context, "/perfil")},
      ),
    ]));
  }
}
