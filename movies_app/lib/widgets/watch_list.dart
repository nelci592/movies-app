import 'package:flutter/material.dart';
import 'package:movies_app/providers/movie.dart';
import 'package:movies_app/widgets/watch_later_item.dart';
import 'package:provider/provider.dart';
import '../providers/movies.dart';

class WatchList extends StatelessWidget {
  const WatchList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesData = Provider.of<Movies>(context);
    var seen = Set<String>();
    List<Movie> movies = moviesData.watchLaterMovies
        .where((movie) => seen.add(movie.title))
        .toList();

    return (movies.isEmpty)
        ? const Center(child: Text('You haven not added movies yet!'))
        : ListView.builder(
            padding: const EdgeInsets.all(10.0),
            itemCount: movies.length,
            itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                value: movies[i], child: WatchLaterItem(movies[i])),
          );
  }
}
