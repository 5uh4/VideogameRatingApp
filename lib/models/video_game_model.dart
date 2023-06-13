class VideoGameModel {
  String? title;
  String? genres;
  String? publishers;
  String? releaseConsole;
  int? releaseYear;
  double? lengthStory;
  late String imageURL;

  VideoGameModel(
      {this.title,
      this.genres,
      this.publishers,
      this.releaseConsole,
      this.releaseYear,
      this.lengthStory,
      required this.imageURL});

  VideoGameModel.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    genres = json['Metadata.Genres'];
    publishers = json['Metadata.Publishers'];
    releaseConsole = json['Release.Console'];
    releaseYear = json['Release.Year'];
    lengthStory = checkDouble(json['Length.Main Story.Median']);
    imageURL = checkImage(json['ImageUrl']);
  }

  static String checkImage(dynamic value) {
    if (value == null) {
      return 'https://m.media-amazon.com/images/I/61o19LyJJBL.jpg';
    } else {
      return value;
    }
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
        'Length.Main Story.Median': lengthStory
      };
}
