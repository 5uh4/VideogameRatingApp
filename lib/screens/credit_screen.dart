import 'package:flutter/material.dart';

class CreditScreen extends StatelessWidget {
  const CreditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pantalla de despedida',
          style: TextStyle(fontFamily: 'Open Sans'),
        ),
      ),
      // Se crea una listview para tener una vista agradable de los creditos a continuación,
      // empleando tarjetas personalizadas
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        children: [
          Card(
              child: Column(
            children: const [
              ListTile(
                leading: Icon(Icons.description_sharp),
                title: Text(
                  'Creador de la aplicacion:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  textAlign: TextAlign.justify,
                ),
                subtitle: Text(
                  'Suhail Matrouch Mohamed',
                  style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
                  textAlign: TextAlign.start,
                ),
              ),
              ListTile(
                leading: Icon(Icons.create_rounded),
                title: Text(
                  'Curso:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  textAlign: TextAlign.justify,
                ),
                subtitle: Text(
                  '2 Desarrollo de Aplicaciones Multiplataforma',
                  style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
                  textAlign: TextAlign.start,
                ),
              ),
              ListTile(
                leading: Icon(Icons.important_devices_rounded),
                title: Text(
                  'Asignatura:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  textAlign: TextAlign.justify,
                ),
                subtitle: Text(
                  'Programación Multimedia y Dispositivos Móviles',
                  style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
                  textAlign: TextAlign.start,
                ),
              ),
              ListTile(
                leading: Icon(Icons.supervisor_account),
                title: Text(
                  'Profesor:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  textAlign: TextAlign.justify,
                ),
                subtitle: Text(
                  'Francisco Fernández Banderas',
                  style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
                  textAlign: TextAlign.start,
                ),
              ),
              ListTile(
                title: Text(
                  'Copyright © Todos los derechos reservados',
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
