import 'package:flutter/material.dart';
import '../providers/user.dart';

class UserNameSection extends StatelessWidget {
  const UserNameSection({
    Key? key,
    required this.user,
  }) : super(key: key);

  final UserDetail user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          user.name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        const SizedBox(height: 4),
        Text(
          user.email,
          style: const TextStyle(color: Colors.grey),
        )
      ],
    );
  }
}
