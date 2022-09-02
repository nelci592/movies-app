import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/movie.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movie = Provider.of<Movie>(context, listen: false);
    int sumRatings =
        movie.ratings.fold(0, (previous, current) => previous + current);
    double avgRating = sumRatings / movie.ratings.length;

    return SizedBox(
        height: 250,
        width: 70,
        child: ListTile(
          leading: Image.network(
            movie.posterUrl,
            errorBuilder: (BuildContext context, Object exception,
                StackTrace? stackTrace) {
              //return a default image if not found
              return Image.network(
                  'https://static.wikia.nocookie.net/simpsons/images/b/bd/Homer_Simpson.png/revision/latest?cb=20201222215437');
            },
          ),
          title: Text(movie.title),
          subtitle: Text('Rating:' + avgRating.toStringAsFixed(2)),
        ));
  }
}
