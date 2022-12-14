import 'package:flutter/material.dart';
import 'package:movies_app/screens/user%20profile%20screens/user_profile_screen.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';
import '../screens/movie screens/watch_list_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.movie),
            title: const Text('All Movies'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.supervised_user_circle),
            title: const Text('User Profile'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(UserProfilePage.routeName);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Watch List'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(WatchListScreen.routeName);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Log out'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed('/');
              Provider.of<Auth>(context, listen: false).logout();
            },
          ),
        ],
      ),
    );
  }
}
