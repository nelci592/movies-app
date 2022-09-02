import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/movies.dart';
import 'movie_item.dart';

class MoviesGrid extends StatelessWidget {
  const MoviesGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesData = Provider.of<Movies>(context);
    final movies = moviesData.movies;

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: movies.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: movies[i], child: const MovieItem()),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 1,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
      ),
    );
  }
}
