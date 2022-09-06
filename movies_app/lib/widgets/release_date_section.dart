import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import '../providers/movie.dart';
import 'detail_item.dart';

class ReleaseDateSection extends StatelessWidget {
  const ReleaseDateSection({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  setReleaseDate(String? releaseDate) {
    if (releaseDate != null) {
      return formatDate(releaseDate);
    } else {
      return 'Missing information';
    }
  }

  formatDate(String date) {
    try {
      var newdate = Jiffy(date).yMMMMd;
      return newdate;
    } on FormatException {
      return Jiffy(date, "yyyy-MM").yMMMMd;
    } finally {
      return Jiffy(date, "yyyy").yMMMMd;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Release Date',
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 10),
          DetailItem(detail: setReleaseDate(movie.releaseDate)),
        ],
      ),
    );
  }
}
