import 'package:flutter/material.dart';

import '../providers/movie.dart';
import 'actor_card.dart';

class ActorsSection extends StatelessWidget {
  const ActorsSection({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cast',
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movie.actors?.length,
              itemBuilder: (context, index) => ActorCard(
                actor: movie.actors![index],
              ),
            ),
          )
        ],
      ),
    );
  }
}
