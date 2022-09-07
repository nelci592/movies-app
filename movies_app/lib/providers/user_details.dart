import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './user.dart';

class UserDetails with ChangeNotifier {
  UserDetail userDetail = UserDetail(
      name: 'John Doe',
      email: 'John Doe email',
      about: 'John Doe about',
      imageUrl:
          'https://pbs.twimg.com/profile_images/725013638411489280/4wx8EcIA_400x400.jpg--');

  Future<void> fetchUserDetails(
    String userId,
    String authToken,
  ) async {
    final url =
        'https://movies-app-ba8b6-default-rtdb.firebaseio.com/userdetails/$userId.json?auth=$authToken';
    try {
      final response = await http.get(Uri.parse(url));
      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      extractedData.forEach((userId, userData) {
        userDetail = UserDetail(
            name: userData['name'],
            email: userData['email'],
            about: userData['about'],
            imageUrl: userData['imageUrl']);
      });
      notifyListeners();
    } catch (error) {
      return;
    }
  }

  Future<void> updateUserDetails(
      String userId, String authToken, UserDetail userDetail) async {
    final url =
        'https://movies-app-ba8b6-default-rtdb.firebaseio.com/userdetails/$userId.json?auth=$authToken';
    try {
      await http.delete(Uri.parse(url));
      http.post(
        Uri.parse(url),
        body: json.encode({
          'name': userDetail.name,
          'email': userDetail.email,
          'about': userDetail.about,
          'imageUrl': userDetail.imageUrl
        }),
      );
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
