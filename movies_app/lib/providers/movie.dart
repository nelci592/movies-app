import 'package:flutter/foundation.dart';

class Movie with ChangeNotifier {
  final String id;
  final String title;
  final String posterUrl;
  final List<int> ratings;
  final List<String> genres;

  Movie(
      {required this.id,
      required this.title,
      required this.posterUrl,
      required this.ratings,
      required this.genres});
}

//enum Genre { Action, Comedy, Crime }
