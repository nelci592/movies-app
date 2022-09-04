import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/movies.dart';
import 'providers/auth.dart';
import 'screens/auth screens/auth_screen.dart';
import 'screens/movie screens/movies_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Movies(),
        ),
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
      ],
      child: MaterialApp(
        title: 'Movies',
        theme: ThemeData(primaryColor: const Color.fromRGBO(58, 66, 86, 1.0)),
        //  home: const MoviesScreen(),
        home: const AuthScreen(),
      ),
    );
  }
}
