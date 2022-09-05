import 'package:flutter/material.dart';

import '../providers/movie.dart';
import 'detail_item.dart';

class GenreSection extends StatelessWidget {
  const GenreSection({
    Key? key,
    required this.movie,
  }) : super(key: key);
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Genre',
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 36,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movie.genres?.length,
              itemBuilder: (context, index) => DetailItem(
                detail: movie.genres![index],
              ),
            ),
          )
        ],
      ),
    );
  }
}
