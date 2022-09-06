import 'package:flutter/material.dart';
import '../providers/auth.dart';
import '../providers/movie.dart';
import '../providers/movies.dart';

class WatchLaterSection extends StatelessWidget {
  const WatchLaterSection({
    Key? key,
    required this.moviesData,
    required this.movie,
    required this.auth,
  }) : super(key: key);

  final Movies moviesData;
  final Movie movie;
  final Auth auth;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          moviesData.addMovieToWatchList(
              movie, auth.userId as String, auth.token as String);
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text('Added to watch list'),
            duration: const Duration(seconds: 2),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                //    moviesData.removeMovieFromWatchList(
                //     movie, auth.userId as String, auth.token as String);
              },
            ),
          ));
        },
        child: const Text('Add to watch list'));
  }
}
