import 'package:flutter/material.dart';
import 'package:movies_app/widgets/app_drawer.dart';
import 'package:provider/provider.dart';
import '../../providers/auth.dart';
import '../../providers/user.dart';
import '../../providers/user_details.dart';
import '../../widgets/profile_widget.dart';
import '../../widgets/text_field.dart';
import 'user_profile_screen.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);
  static const routeName = '/userProfileEdit';

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  // User user = UserPreferences.myUser;
  UserDetail user = UserDetail(
      name: 'John Doe',
      email: 'John Doe email',
      about: 'John Doe about',
      imageUrl:
          'https://pbs.twimg.com/profile_images/725013638411489280/4wx8EcIA_400x400.jpg--');

  @override
  Widget build(BuildContext context) {
    final userDetails = Provider.of<UserDetails>(context);
    final auth = Provider.of<Auth>(context);
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final aboutController = TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      drawer: const AppDrawer(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        physics: const BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            isEdit: true,
            onClicked: () async {},
          ),
          const SizedBox(height: 24),
          TextFieldWidget(
            label: 'Name',
            text: user.name,
            controller: nameController,
            onChanged: (name) {},
          ),
          const SizedBox(height: 24),
          TextFieldWidget(
            label: 'Email',
            text: user.email,
            controller: emailController,
            onChanged: (email) {},
          ),
          const SizedBox(height: 24),
          TextFieldWidget(
            label: 'About',
            controller: aboutController,
            text: user.about,
            maxLines: 5,
            onChanged: (about) {},
          ),
          TextButton(
            onPressed: () {
              UserDetail updatedUserDetail = UserDetail(
                  name: nameController.text,
                  email: emailController.text,
                  about: aboutController.text,
                  imageUrl:
                      'https://pbs.twimg.com/profile_images/725013638411489280/4wx8EcIA_400x400.jpg--');
              userDetails.updateUserDetails(auth.userId as String,
                  auth.token as String, updatedUserDetail);
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                    builder: (context) => const UserProfilePage()),
              );
            },
            child: const Text('Update details'),
          )
        ],
      ),
    );
  }
}
