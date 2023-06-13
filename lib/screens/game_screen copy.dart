import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:videogame_rater/FileManager/file_manager_service.dart';
import 'game_screen.dart';

class _GameScreenState extends State<GameScreenSinDb> {
  final DatabaseReference _databaseReference =
      FirebaseDatabase.instance.ref().child("videojuegos");
  FileManagerService fms = FileManagerService();
  bool isFav = false;
  double rating = 0.0;

  @override
  void initState() {
    super.initState();
    loadUserRatingAndFavoriteStatus();
  }

  Future<void> loadUserRatingAndFavoriteStatus() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userId = user.uid;
      final userSnapshot = await FirebaseFirestore.instance
          .collection('usuarios')
          .doc(userId)
          .get();

      if (userSnapshot.exists) {
        final userData = userSnapshot.data() as Map<String, dynamic>;
        final userFavorites = userData['Favorites'] as List<dynamic>;
        final userRatings = userData['Ratings'] as Map<String, dynamic>;

        setState(() {
          isFav = userFavorites.contains(widget.juego.title);
          rating = userRatings[widget.juego.title]?.toDouble() ?? 0.0;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.juego.title.toString()),
      ),
      body: ListView(
        children: [
          // Resto del código de la pantalla de detalles del juego...

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RatingBar.builder(
                initialRating: rating,
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                // Resto de las propiedades de la RatingBar...
                onRatingUpdate: (newRating) {
                  setState(() {
                    rating = newRating;
                    saveUserRating();
                  });
                },
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    isFav = !isFav;
                    saveUserFavoriteStatus();
                  });
                },
                child: Icon(
                  isFav
                      ? Icons.favorite_rounded
                      : Icons.favorite_border_rounded,
                  size: 25,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void saveUserRating() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userId = user.uid;
      final userRatingsRef =
          FirebaseFirestore.instance.collection('users').doc(userId);

      userRatingsRef.set({
        'ratings': {widget.juego.title: rating},
      }, SetOptions(merge: true));
    }
  }

  void saveUserFavoriteStatus() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userId = user.uid;
      final userFavoritesRef =
          FirebaseFirestore.instance.collection('users').doc(userId);

      if (isFav) {
        userFavoritesRef.update({
          'favorites': FieldValue.arrayUnion([widget.juego.title]),
        });
      } else {
        userFavoritesRef.update({
          'favorites': FieldValue.arrayRemove([widget.juego.title]),
        });
      }
    }
  }
}
