import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './movie.dart';

class Movies with ChangeNotifier {
  List<Movie> _movies = [];

  List<Movie> get movies {
    return [..._movies];
  }

  List<Movie> _watchLaterMovies = [];

  List<Movie> get watchLaterMovies {
    return [..._watchLaterMovies];
  }

  Movie findMovieById(String id) {
    return _movies.firstWhere((movie) => movie.id == id);
  }

  bool isInWatchLater(Movie movie) {
    return watchLaterMovies.contains(movie);
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
            releaseDate: movie['releaseDate'],
            ratings: (movie['ratings']).cast<int>(),
            genres: (movie['genres']).cast<String>(),
            actors: (movie['actors']).cast<String>()));
      });
      _movies = loadedMovies;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> addMovieToWatchList(
    Movie movie,
    String userId,
    String authToken,
  ) async {
    final url =
        'https://movies-app-ba8b6-default-rtdb.firebaseio.com/movies/$userId.json?auth=$authToken';
    try {
      await http.post(
        Uri.parse(url),
        body: json.encode({
          'id': movie.id,
          'title': movie.title,
          'posterUrl': movie.posterUrl
        }),
      );
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  // void deleteMovieFromWatchLater(String id) {
  //   _watchLaterMovies.removeWhere((movie) => movie.id == id);
  //   notifyListeners();
  // }

  Future<void> deleteMovieFromWatchLater(
      String movieId, String id, String authToken) async {
    _watchLaterMovies.removeWhere((movie) => movie.id == movieId);
    final url =
        'https://movies-app-ba8b6-default-rtdb.firebaseio.com/movies/$id.json?auth=$authToken';

    await http.delete(
      Uri.parse(url),
    );

    _watchLaterMovies.forEach((movie) {
      http.post(
        Uri.parse(url),
        body: json.encode({
          'id': movie.id,
          'title': movie.title,
          'posterUrl': movie.posterUrl
        }),
      );
      notifyListeners();
    });
  }

  Future<void> fetchWatchLaterMovies(
    String userId,
    String authToken,
  ) async {
    final url =
        'https://movies-app-ba8b6-default-rtdb.firebaseio.com/movies/$userId.json?auth=$authToken';
    try {
      final response = await http.get(Uri.parse(url));
      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      final List<Movie> loadedMovies = [];
      extractedData.forEach((prodId, prodData) {
        loadedMovies.add(Movie(
            id: prodData['id'],
            title: prodData['title'],
            posterUrl: prodData['posterUrl']));
      });
      _watchLaterMovies = loadedMovies;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
