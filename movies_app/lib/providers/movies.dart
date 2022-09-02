import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './movie.dart';

class Movies with ChangeNotifier {
  List<Movie> _movies = [];

  List<Movie> get movies {
    return [..._movies];
  }

  Future<void> fetchMovies() async {
    const url =
        'https://raw.githubusercontent.com/FEND16/movie-json-data/master/json/movies-coming-soon.json';
    try {
      final response = await http.get(Uri.parse(url));
      final extractedData = json.decode(response.body);
      final List<Movie> loadedMovies = [];
      extractedData.forEach((movie) {
        loadedMovies.add(Movie(
            id: movie['id'],
            title: movie['title'],
            posterUrl: movie['posterurl'],
            ratings: (movie['ratings']).cast<int>(),
            genres: (movie['genres']).cast<String>()));
      });
      _movies = loadedMovies;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
