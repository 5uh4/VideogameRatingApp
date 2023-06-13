// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:videogame_rater/models/video_game_model.dart';
import 'package:videogame_rater/screens/game_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.juegos});
  final List<VideoGameModel> juegos;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late List<VideoGameModel> listaFiltrada = widget.juegos;
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Barra de Busqueda'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            // Este es el elemento mediante el cual buscamos, emplea un metodo creado más abajos
            // que sirve para buscar dentro de la lista copiada del menu de todos los videojuegos
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                  labelText: "Busqueda por nombre",
                  hintText: "Nombre",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              //Aqui se utiliza el metodo mencionando previamente
              onChanged: buscarJuego,
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: listaFiltrada.length,
              itemBuilder: (context, index) {
                // Con esta variable podemos tener guardados los titulos que aparecen, y asi si pinchamos nos lleva
                // directamente a la pantalla de detalles del juego elegido
                final juego = listaFiltrada[index];
                return ListTile(
                  title: Text(
                    juego.title.toString(),
                    textAlign: TextAlign.center,
                  ),
                  // Este es el controlador que se encarga de que al pinchar en un elemento nos lleve a
                  //la pantalla de detalles
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GameScreenSinDb(juego: juego),
                      )),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  //Este es el metodo en cuestion, por el cual creamos una nueva lista con los titulos posibles y reemplazamos la visible
  void buscarJuego(String busqueda) {
    final sugerencias = widget.juegos.where((juego) {
      final gameTitle = juego.title!.toLowerCase();
      final input = busqueda.toLowerCase();
      return gameTitle.contains(input);
    }).toList();
    setState(() => listaFiltrada = sugerencias);
  }
}
