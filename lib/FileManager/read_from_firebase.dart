import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import '../models/video_game_model.dart';

class FirebaseManagerService {
  Future<List<VideoGameModel>> leerDesdeFireStore() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('videogames').get();

    List<VideoGameModel> videoGames = querySnapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return VideoGameModel(
          title: data['Title'],
          genres: data['Genres'],
          publishers: data['Publishers'],
          releaseConsole: data['Release Console'],
          releaseYear: data['Release Year'],
          lengthStory: data['Main Story Length'] != null
              ? double.tryParse(data['Main Story Length'].toString())
              : null,
          imageURL: data['ImageUrl']);
    }).toList();

    return videoGames;
  }

  Future<List<VideoGameModel>> leerFirebaseData() async {
    DatabaseReference databaseReference =
        FirebaseDatabase.instance.ref().child('videogames');
    DataSnapshot dataSnapshot = await databaseReference.get();
    if (dataSnapshot.value == null) {
      return [];
    }

    Map<dynamic, dynamic> dataMap = dataSnapshot.value as Map<dynamic, dynamic>;

    List<VideoGameModel> juegos = [];

    dataMap.forEach((key, value) {
      Map<dynamic, dynamic> gameData = value;
      VideoGameModel videoGame = VideoGameModel(
        title: gameData['Title'].toString(),
        genres: gameData['Genres'].toString(),
        publishers: gameData['Publishers'].toString(),
        releaseConsole: gameData['Release Console'].toString(),
        releaseYear: gameData['Release Year'],
        lengthStory: gameData['Main Story Length'],
        imageURL: gameData['ImageUrl'].toString(),
      );
      juegos.add(videoGame);
    });

    return juegos;
  }
}



   /** dataMap.forEach((key, value) {
      Map<dynamic, dynamic> gameData = value;
      VideoGameModel videogame = VideoGameModel(
        title: gameData['Title'],
        genres: gameData['Genres'],
        publishers: gameData['Publishers'],
        releaseConsole: gameData['Release Console'],
        lengthStory: gameData['Main Story Length Median'],
        releaseYear: gameData['Release Year'],
        ratingOutOfFive: gameData['outOfFive'],
        isFavGame: gameData['isFav'],
        imageURL: gameData['ImageUrl'],
      );
      juegos.add(videogame);
    });
    return juegos;*/
/** return dataMap.entries.map((entry) {
      String gameKey = entry.key;
      Map<dynamic, dynamic> gameData = entry.value;
      return VideoGameModel(
        title: gameData['Title'],
        genres: gameData['Genres'],
        publishers: gameData['Publishers'],
        releaseConsole: gameData['Release Console'],
        lengthStory: gameData['Main Story Length Median'],
        releaseYear: gameData['Release Year'],
        ratingOutOfFive: gameData['outOfFive'],
        isFavGame: gameData['isFav'],
        imageURL: gameData['ImageUrl'],
      );
    }).toList();
  }
}
   */
 


