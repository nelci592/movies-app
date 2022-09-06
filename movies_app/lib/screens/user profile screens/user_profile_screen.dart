import 'package:flutter/material.dart';
import 'package:movies_app/widgets/app_drawer.dart';
import 'package:provider/provider.dart';
import '../../providers/auth.dart';
import '../../providers/user_details.dart';
import '../../widgets/profile_widget.dart';
import '../../widgets/user_about_section.dart';
import '../../widgets/user_name_section.dart';

class UserProfilePage extends StatefulWidget {
  static const routeName = '/userProfile';
  const UserProfilePage({Key? key}) : super(key: key);
  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
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
      Provider.of<UserDetails>(context)
          .fetchUserDetails(auth.userId as String, auth.token as String)
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
    final userData = Provider.of<UserDetails>(context);
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(title: const Text('Profile')),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: ProfileWidget(
              imagePath: userData.userDetail.imageUrl,
              onClicked: () async {},
            ),
          ),
          const SizedBox(height: 24),
          UserNameSection(user: userData.userDetail),
          TextButton(onPressed: () {}, child: const Text('Change password')),
          UserAboutSection(user: userData.userDetail),
        ],
      ),
    );
  }
}
