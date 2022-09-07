import 'package:flutter/material.dart';
import 'package:movies_app/screens/user%20profile%20screens/user_profile_screen.dart';
import 'package:provider/provider.dart';
import './providers/movies.dart';
import './providers/auth.dart';
import 'providers/user_details.dart';
import 'screens/auth screens/auth_screen.dart';
import 'screens/movie screens/movies_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/movie screens/watch_list_screen.dart';

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
            value: Auth(),
          ),
          ChangeNotifierProvider.value(
            value: Movies(),
          ),
          ChangeNotifierProvider.value(
            value: UserDetails(),
          ),
        ],
        child: Consumer<Auth>(
          builder: (ctx, auth, _) => MaterialApp(
            title: 'Movies',
            theme:
                ThemeData(primaryColor: const Color.fromRGBO(58, 66, 86, 1.0)),
            home: auth.isAuth
                ? const MoviesScreen()
                : FutureBuilder(
                    future: auth.tryAutoLogin(),
                    builder: (ctx, authResultSnapshot) =>
                        authResultSnapshot.connectionState ==
                                ConnectionState.waiting
                            ? const SplashScreen()
                            : const AuthScreen(),
                  ),
            routes: {
              WatchListScreen.routeName: (ctx) => const WatchListScreen(),
              UserProfilePage.routeName: (ctx) => const UserProfilePage(),
            },
          ),
        ));
  }
}
