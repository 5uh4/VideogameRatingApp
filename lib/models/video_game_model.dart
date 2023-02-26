// ignore_for_file: public_member_api_docs, sort_constructors_first, file_names
import 'dart:convert';

class VideoGameModel {
  String? title;
  String? genres;
  String? publishers;
  String? releaseConsole;
  int? releaseYear;
  double? lengthStory;
  late bool isFavGame;
  late double ratingOutOfFive;

  VideoGameModel(
      {this.title,
      this.genres,
      this.publishers,
      this.releaseConsole,
      this.releaseYear,
      this.lengthStory,
      required this.isFavGame,
      required this.ratingOutOfFive});

  VideoGameModel.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    genres = json['Metadata.Genres'];
    publishers = json['Metadata.Publishers'];
    releaseConsole = json['Release.Console'];
    releaseYear = json['Release.Year'];
    lengthStory = checkDouble(json['Length.Main Story.Median']);
    isFavGame = checkFavGame(json['isFavGame']);
    ratingOutOfFive = checkRating(json['ratingOutOfFive']);
  }

  static double checkDouble(dynamic value) {
    return value.toDouble();
  }

  static bool checkFavGame(dynamic value) {
    if (value == null) {
      return false;
    } else {
      return value;
    }
  }

  static double checkRating(dynamic value) {
    if (value == null) {
      return 0.0;
    } else {
      return double.parse(value);
    }
  }

  Map<String, dynamic> toJson() => {
        'Title': title,
        'Metadata.genres': genres,
        'Metadata.publishers': publishers,
        'Release.Console': releaseConsole,
        'Release.Year': releaseYear,
        'Length.Main Story.Median': lengthStory,
        'isFavGame': isFavGame,
        'ratingOutOfFive': ratingOutOfFive
      };
}
