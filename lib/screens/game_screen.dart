// ignore_for_file: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:videogame_rater/models/video_game_model.dart';

class GameScreenSinDb extends StatefulWidget {
  const GameScreenSinDb({super.key, required this.juego});
  // Aquí recibimos el juego de la pantalla principal
  final VideoGameModel juego;

  @override
  State<GameScreenSinDb> createState() => _GameScreenSinDbState();
}

class _GameScreenSinDbState extends State<GameScreenSinDb> {
  bool isFav = false;
  double rating = 0.0;
  DocumentReference<Map<String, dynamic>>? userRatingDoc;

  @override
  void initState() {
    super.initState();
    loadUserRatingAndFavoriteStatus();
  }

// Método para cargar la puntuación y el estado de favorito en la pantalla
  Future<void> loadUserRatingAndFavoriteStatus() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userId = user.uid;
      final gameId = widget.juego.title;

      final videoGameRef = await FirebaseFirestore.instance
          .collection('videogames')
          .where('Title', isEqualTo: gameId)
          .limit(1)
          .get();

      if (videoGameRef.docs.isNotEmpty) {
        final videoGameDoc = videoGameRef.docs.first;

        final userSnapshot = await FirebaseFirestore.instance
            .collection('usuarios')
            .doc(userId)
            .collection('puntuaciones')
            .where('Videogame', isEqualTo: videoGameDoc.reference)
            .limit(1)
            .get();

        if (userSnapshot.docs.isNotEmpty) {
          userRatingDoc = userSnapshot.docs.first.reference;
          final userData = userSnapshot.docs.first.data();
          final rating = userData['Rating'] as double;
          final favorite = userData['Favorite'] as bool;
          setState(() {
            this.rating = rating;
            isFav = favorite;
          });
        } else {
          userRatingDoc =
              await createNewUserRatingDocument(userId, videoGameDoc.reference);
          setState(() {
            rating = 0.0;
            isFav = false;
          });
        }
      }
    }
  }

  Future<DocumentReference<Map<String, dynamic>>> createNewUserRatingDocument(
      String userId,
      DocumentReference<Map<String, dynamic>> videoGameRef) async {
    return await FirebaseFirestore.instance
        .collection('usuarios')
        .doc(userId)
        .collection('puntuaciones')
        .add({'Videogame': videoGameRef, 'Favorite': false, 'Rating': 0.0});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // Al asignar el titulo del juego al titulo de la appbar lo vemos directamente reflejado
        appBar: AppBar(
          title: Text(widget.juego.title.toString()),
        ),
        // Este listview nos permite ver cada elemento del juego, es decir, los detalles del mismo
        body: ListView(
          children: [
            Card(
                elevation: 5,
                margin: const EdgeInsets.all(8),
                child: Column(
                  children: [
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8, right: 8),
                                        child: Image(
                                            image: NetworkImage(widget
                                                .juego.imageURL
                                                .toString())),
                                      ),
                                    ])),
                          ),
                        ],
                      ),
                    ),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                )),
            // Por medio de este floating action button tenemos las estrellas para poder puntuar y el boton de favorito
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RatingBar.builder(
                  initialRating: rating,
                  minRating: 1,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(
                      horizontal: 7.0, vertical: 10.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  //Aquí actualizamos los datos de la lista para que se vea la puntuacion
                  onRatingUpdate: (newRating) {
                    setState(() {
                      rating = newRating;
                      saveUserRating(newRating);
                    });
                  },
                ),
                FloatingActionButton(
                    // Y aquí cambiamos el boton en funcion de si es favorito o no
                    onPressed: () {
                      setState(() {
                        if (isFav) {
                          isFav = false;
                        } else {
                          isFav = true;
                        }
                        saveUserFavoriteStatus(isFav);
                      });
                    },
                    // Por medio de este operador ternario determinamos el estado del boton,
                    // si es favorito esta relleno y si no esta hueco
                    child: Icon(
                        (isFav
                            ? Icons.favorite_rounded
                            : Icons.favorite_border_rounded),
                        size: 25)),
              ],
            )
          ],
        ));
  }

// Método para guardar o actualizar la puntuación del usuario
  void saveUserRating(double rating) async {
    if (userRatingDoc != null) {
      await userRatingDoc!.update({'Rating': rating});
      setState(() {
        this.rating = rating;
      });
    }
  }

// Método para guardar o actualizar el estado de favorito del usuario
  void saveUserFavoriteStatus(bool isFavorite) async {
    if (userRatingDoc != null) {
      await userRatingDoc!.update({'Favorite': isFavorite});
      setState(() {
        isFav = isFavorite;
      });
    }
  }
}
