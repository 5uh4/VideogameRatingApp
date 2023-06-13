// ignore_for_file: library_prefixes, unnecessary_null_comparison
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:videogame_rater/FileManager/read_from_firebase.dart';
import 'package:videogame_rater/models/video_game_model.dart';
import 'package:videogame_rater/screens/game_screen.dart';
import 'package:videogame_rater/screens/search_screen.dart';

class GamesScreen extends StatefulWidget {
  const GamesScreen({super.key});

  @override
  State<GamesScreen> createState() => _GamesScreenState();
}

class _GamesScreenState extends State<GamesScreen> {
  TextEditingController editingController = TextEditingController();
  late List<VideoGameModel> juegos;
  FirebaseManagerService fbs = FirebaseManagerService();
  // FileManagerService fms = FileManagerService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VideoGame rater'),
        //Al colocar aqui un boton podemos acceder a la pantalla de busqueda de titulos por nombre
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SearchScreen(
                              juegos: juegos,
                            )));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      // Requerimos un future builder puesto que debe obtener informacion de la bd que tenemos
      // en firebase y cargarlo en una lista
      body: FutureBuilder(
          future: fbs.leerDesdeFireStore(),
          builder: (context, snapshot) {
            // Esto se asegura de que los datos se cargan correctamente.
            if (snapshot.hasError) {
              return Center(child: Text("${snapshot.error}"));
            } else if (snapshot.hasData) {
              juegos = snapshot.data!;
              return ListView.builder(
                  // Y aquí creamos la lista con todos los juegos,
                  // le añadimos decoracion
                  itemCount: juegos == null ? 0 : juegos.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: Card(
                        elevation: 5,
                        color:
                            Colors.primaries[index % Colors.primaries.length],
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 6),
                        child: Container(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: Image(
                                        image: NetworkImage(
                                            juegos[index].imageURL.toString()),
                                        fit: BoxFit.fill)),
                                Expanded(
                                  child: Container(
                                      padding: const EdgeInsets.only(bottom: 8),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8, right: 8),
                                              child: Text(
                                                juegos[index].title.toString(),
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8, right: 8),
                                                child: Text(
                                                  juegos[index]
                                                      .genres
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ))
                                          ])),
                                )
                              ],
                            )),
                      ),
                      // Este onTap es el controlador que envia a la pantalla del juego concreto al pinchar en el
                      onTap: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GameScreenSinDb(
                                      juego: juegos[index],
                                    )))
                      },
                    );
                  });
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
