// ignore_for_file: file_names

import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

import '../models/video_game_model.dart';

const initialAssetFile = 'assets/videogamejson.json';
const localFileName = 'data.json';

class FileManagerService {
  Future<File> _initializeFile() async {
    final localDirectory = await getExternalStorageDirectories();
    final file = File('$localDirectory/$localFileName');
    if (!await file.exists()) {
      final initialContent = await rootBundle.loadString(initialAssetFile);
      await file.create();
      await file.writeAsString(initialContent);
    }

    return file;
  }

  Future<List<VideoGameModel>> leerJsonData() async {
    /* final file = await _initializeFile();
    final list = json.decode(file.toString()) as List<dynamic>;
    return list.map((e) => VideoGameModel.fromJson(e)).toList(); */
    final jsondata = await rootBundle.loadString('assets/videogamejson.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => VideoGameModel.fromJson(e)).toList();
  }

  Future<void> writeToJsonFile(VideoGameModel vgm) async {
    try {
      File jsonFile = await _initializeFile();
      await jsonFile.writeAsString(json.encode(vgm));
    } catch (e) {
      print(e);
    }
  }
}
