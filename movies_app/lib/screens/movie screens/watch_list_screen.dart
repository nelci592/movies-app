import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/movies.dart';
import '../../providers/auth.dart';
import '../../widgets/watch_list.dart';
import '../../widgets/app_drawer.dart';

class WatchListScreen extends StatefulWidget {
  static const routeName = '/watchLater';
  const WatchListScreen({Key? key}) : super(key: key);

  @override
  State<WatchListScreen> createState() => _WatchListScreenState();
}

class _WatchListScreenState extends State<WatchListScreen> {
  var _isLoading = false;
  var _isInit = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      final auth = Provider.of<Auth>(context);

      Provider.of<Movies>(context)
          .fetchWatchLaterMovies(auth.userId as String, auth.token as String)
          .then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watch List Movies'),
      ),
      drawer: const AppDrawer(),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : const WatchList(),
    );
  }
}
