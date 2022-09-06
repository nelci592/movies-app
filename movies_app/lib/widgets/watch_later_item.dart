import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';
import '../providers/movie.dart';
import '../providers/movies.dart';
import 'poster.dart';

class WatchLaterItem extends StatelessWidget {
  final Movie movie;
  //final Movies moviesData;

  const WatchLaterItem(this.movie, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesData = Provider.of<Movies>(context);
    final auth = Provider.of<Auth>(context);

    return Dismissible(
      key: ValueKey(movie.id),
      background: Container(
        color: Colors.blue,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: const Text('Are you sure?'),
                  content: const Text(
                      'Do you want to remove this movie from your watch list?'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop(false);
                        },
                        child: const Text('No')),
                    TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop(true);
                        },
                        child: const Text('Yes'))
                  ],
                ));
      },
      onDismissed: (direction) {
        moviesData.deleteMovieFromWatchLater(
            movie.id, auth.userId as String, auth.token as String);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
              leading: CircleAvatar(
                child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Poster(movie: movie)),
              ),
              title: Text(movie.title),
              trailing: IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: Colors.blue,
                ),
                onPressed: () {
                  moviesData.deleteMovieFromWatchLater(
                      movie.id, auth.userId as String, auth.token as String);
                },
              )),
        ),
      ),
    );
  }
}
