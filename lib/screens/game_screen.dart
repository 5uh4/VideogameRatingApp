// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:videogame_rater/FileManager/file_manager_service.dart';
import 'package:videogame_rater/models/video_game_model.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key, required this.juego});
  // Aquí recibimos el juego de la pantalla principal
  final VideoGameModel juego;

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  FileManagerService fms = FileManagerService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Al asignar el titulo del juego al titulo de la appbar lo vemos directamente reflejado
      appBar: AppBar(
        title: Text(widget.juego.title.toString()),
      ),
      // Este listview nos permite ver cada elemento del juego, es decir, los detalles del mismo
      body: ListView(children: [
        Card(
            elevation: 5,
            margin: const EdgeInsets.all(8),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8),
                                    child: Text(
                                      'Titulo del juego: ${widget.juego.title.toString()}',
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ])),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8),
                                    child: Text(
                                      'Generos del juego: ${widget.juego.genres.toString()}',
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'Open Sans'),
                                    ),
                                  ),
                                ])),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8),
                                    child: Text(
                                      'Desarrollador del juego: ${widget.juego.publishers.toString()}',
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'Open Sans'),
                                    ),
                                  ),
                                ])),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8),
                                    child: Text(
                                      'Año de salida original: ${widget.juego.releaseYear.toString()}',
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'Open Sans'),
                                    ),
                                  ),
                                ])),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8),
                                    child: Text(
                                      'Consola de salida original: ${widget.juego.releaseConsole.toString()}',
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'Open Sans'),
                                    ),
                                  ),
                                ])),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8),
                                    child: Text(
                                      'Duracion media de la historia (Horas): ${widget.juego.lengthStory.toString()}',
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Open Sans'),
                                    ),
                                  ),
                                ])),
                      ),
                    ],
                  ),
                ),
              ],
            ))
      ]),
      // Por medio de est floating action button tenemos las estrellas para poder puntuar y el boton de favorito
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          RatingBar.builder(
            initialRating: widget.juego.ratingOutOfFive,
            minRating: 1,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding:
                const EdgeInsets.symmetric(horizontal: 7.0, vertical: 10.0),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            //Aquí actualizamos los datos de la lista para que se vea la puntuacion
            onRatingUpdate: (rating) {
              widget.juego.ratingOutOfFive = rating;
              setState(() {});
            },
          ),
          FloatingActionButton(
              // Y aquí cambiamos el boton en funcion de si es favorito o no
              onPressed: () {
                setState(() {
                  if (widget.juego.isFavGame) {
                    widget.juego.isFavGame = false;
                  } else {
                    widget.juego.isFavGame = true;
                  }
                });
              },
              // Por medio de este operador ternario determinamos el estado del boton,
              // si es favorito esta relleno y si no esta hueco
              child: Icon(
                  (widget.juego.isFavGame
                      ? Icons.favorite_rounded
                      : Icons.favorite_border_rounded),
                  size: 25)),
        ],
      ),
    );
  }
}
