import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/movie.dart';
import '../screens/movie screens/movie_details_screen.dart';
import 'poster.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movie = Provider.of<Movie>(context, listen: false);
    int sumRatings =
        movie.ratings!.fold(0, (previous, current) => previous + current);
    double avgRating = sumRatings / movie.ratings!.length;

    return SizedBox(
        height: 250,
        width: 70,
        child: ListTile(
            leading: Poster(movie: movie),
            title: Text(movie.title, maxLines: 2),
            subtitle: Text('Rating:' + avgRating.toStringAsFixed(2)),
            onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieDetailsScreen(id: movie.id),
                  ),
                )));
  }
}
