import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/features/user/presentation/viewmodel/user_view_model.dart';

import '../../../../core/common/snackbar/my_snackbar.dart';
import '../../domain/entity/user_entity.dart';
import '../viewmodel/user_profile_view_model.dart';

class UpdateProfilePage extends ConsumerStatefulWidget {
  const UpdateProfilePage({Key? key}) : super(key: key);

  @override
  _UpdateProfilePageState createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends ConsumerState<UpdateProfilePage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    var userState = ref.read(userProfileViewModelProvider);
    List<UserEntity> userList = userState.users;
    if (userList.isNotEmpty) {
      _nameController.text = userList[0].name;
      _emailController.text = userList[0].email;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var userState = ref.watch(userProfileViewModelProvider);
    List<UserEntity> userList = userState.users;

    var profileState = ref.watch(userProfileViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Update Profile',
          style: TextStyle(
            color: Colors.amber,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        // backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.network(
                  "https://cdn-icons-png.flaticon.com/512/146/146031.png",
                  height: 150,
                  width: 200,
                ),
                // const SizedBox(height: 40),
                // const CircleAvatar(
                //   radius: 70,
                //   backgroundImage: AssetImage('assets/images/login.png'),
                // ),
                const SizedBox(height: 20),
                itemProfile(Icons.person, _nameController),
                const SizedBox(height: 10),
                itemProfile(Icons.mail, _emailController),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // Create a new profile entity
                      UserEntity user = UserEntity(
                        name: _nameController.text,
                        email: _emailController.text,
                      );

                      // Call the edit profile method
                      await profileState.editProfile(user);

                      await ref
                          .watch(userViewModelProvider.notifier)
                          .getUserInfo();

                      showSnackBar(
                        context: context,
                        message: 'Profile edited successfully',
                        color: Colors.green,
                      );

                      // Navigate back to UserProfilePage and refresh the page
                      Navigator.pop(context, true);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Save Changes',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget itemProfile(IconData iconData, TextEditingController controller) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            color: Colors.deepOrange.withOpacity(.2),
            spreadRadius: 2,
            blurRadius: 10,
          ),
        ],
      ),
      child: ListTile(
        title: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
        ),
        leading: Icon(iconData),
        tileColor: Colors.white,
      ),
    );
  }
}