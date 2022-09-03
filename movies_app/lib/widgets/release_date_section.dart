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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Release Date',
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 20),
          DetailItem(detail: Jiffy(movie.releaseDate).yMMMMd),
        ],
      ),
    );
  }
}
