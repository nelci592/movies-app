import 'package:flutter/material.dart';
import '../providers/movie.dart';

class Poster extends StatelessWidget {
  const Poster({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      movie.posterUrl,
      errorBuilder:
          (BuildContext context, Object exception, StackTrace? stackTrace) {
        //return a default image if not found
        return Image.network(
            'https://static.wikia.nocookie.net/simpsons/images/b/bd/Homer_Simpson.png/revision/latest?cb=20201222215437');
      },
    );
  }
}
