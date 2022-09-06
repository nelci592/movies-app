import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './user.dart';

class UserDetails with ChangeNotifier {
  late UserDetail userDetail;

  Future<void> fetchUserDetails(
    String userId,
    String authToken,
  ) async {
    final url =
        'https://movies-app-ba8b6-default-rtdb.firebaseio.com/userdetails/$userId.json?auth=$authToken';
    try {
      final response = await http.get(Uri.parse(url));
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      UserDetail userDetail = UserDetail(
        name: extractedData['name'],
        email: extractedData['email'],
        about: extractedData['about'],
        imageUrl: extractedData['imageUrl'],
      );
      userDetail = userDetail;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
