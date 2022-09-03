import 'package:flutter/material.dart';

class ActorCard extends StatelessWidget {
  final String actor;
  const ActorCard({Key? key, required this.actor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      width: 80,
      child: Column(
        children: [
          Container(
            height: 80,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(
                  'https://pbs.twimg.com/profile_images/725013638411489280/4wx8EcIA_400x400.jpg',
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            actor,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText2,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
