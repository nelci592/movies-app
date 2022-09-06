import 'package:flutter/foundation.dart';

class UserDetail with ChangeNotifier {
  final String name;
  final String email;
  final String about;
  final String imageUrl;

  UserDetail({
    required this.name,
    required this.email,
    required this.about,
    required this.imageUrl,
  });
}
