import 'package:flutter/material.dart';
import '../providers/user.dart';

class UserAboutSection extends StatelessWidget {
  const UserAboutSection({
    Key? key,
    required this.user,
  }) : super(key: key);

  final UserDetail user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'About',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            user.about,
            style: const TextStyle(fontSize: 16, height: 1.4),
          ),
        ],
      ),
    );
  }
}
