// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:videogame_rater/models/video_game_model.dart';

class SearchScreen extends StatelessWidget {
  final List<VideoGameModel> juegos;
  const SearchScreen({super.key, required this.juegos});

  @override
  Widget build(BuildContext context) {
    TextEditingController editingController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Barra de Busqueda'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {},
              controller: editingController,
              decoration: const InputDecoration(
                  labelText: "Search",
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)))),
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: juegos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${juegos[index]}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
