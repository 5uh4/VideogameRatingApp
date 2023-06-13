// ignore_for_file: file_names

import 'dart:convert';
import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

import '../models/video_game_model.dart';

const initialAssetFile = 'assets/videogamejson.json';
const localFileName = 'data.json';

class FileManagerService {
  //Este metodo se encarga de leer el archivo json en el que tenemos nuestros datos y
  // convertirlos en una lista para que la pantalla principal pueda reflejarlo en su lista.
  Future<List<VideoGameModel>> leerJsonData() async {
    final jsondata = await rootBundle.loadString('assets/videogamejson.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return Future.value(list.map((e) => VideoGameModel.fromJson(e)).toList());
  }
}
