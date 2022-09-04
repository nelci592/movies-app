import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/movies.dart';
import '../../widgets/poster.dart';
import '../../widgets/actors_section.dart';
import '../../widgets/genre_section.dart';
import '../../widgets/release_date_section.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  Widget build(BuildContext context) {
    final moviesData = Provider.of<Movies>(context);
    var movie = moviesData.findMovieById(id);
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              // setting the height based on the device's size
              height: deviceSize.height / 3,
              child: Poster(movie: movie),
            ),
            ReleaseDateSection(movie: movie),
            GenreSection(movie: movie),
            ActorsSection(movie: movie)
          ],
        ),
      ),
    );
  }
}
