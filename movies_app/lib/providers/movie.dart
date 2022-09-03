import 'package:flutter/foundation.dart';

class Movie with ChangeNotifier {
  final String id;
  final String title;
  final String posterUrl;
  final String releaseDate;
  final List<int> ratings;
  final List<String> genres;
  final List<String> actors;

  Movie(
      {required this.id,
      required this.title,
      required this.posterUrl,
      required this.releaseDate,
      required this.ratings,
      required this.genres,
      required this.actors});
}

//enum Genre { Action, Comedy, Crime }
