// ignore_for_file: public_member_api_docs, sort_constructors_first
class VideoGameModel {
  String? title;
  String? genres;
  String? publishers;
  String? releaseConsole;
  int? releaseYear;
  double? lengthStory;

  VideoGameModel({
    this.title,
    this.genres,
    this.publishers,
    this.releaseConsole,
    this.releaseYear,
    this.lengthStory,
  });

  VideoGameModel.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    genres = json['Metadata.Genres'];
    publishers = json['Metadata.Publishers'];
    releaseConsole = json['Release.Console'];
    releaseYear = json['Release.Year'];
    lengthStory = checkDouble(json['Length.Main Story.Median']);
  }

  static double checkDouble(dynamic value) {
    return value.toDouble();
  }
}
