import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/features/user/presentation/view/updateprofile.dart';

import '../../../../core/common/snackbar/my_snackbar.dart';
import '../../../home/presentation/viewmodel/logout_view_model.dart';
import '../../domain/entity/user_entity.dart';
import '../viewmodel/user_profile_view_model.dart';

class UserProfilePage extends ConsumerStatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  ConsumerState<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends ConsumerState<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    var userState = ref.watch(userProfileViewModelProvider);
    List<UserEntity> userList = userState.users;
    if (userList.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(), // Show loader
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.amber,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        // backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              ref.read(userProfileViewModelProvider.notifier).getUserInfo();
              // ref.read(courseViewModelProvider.notifier).getCourses();
              showSnackBar(message: 'Refressing...', context: context);
            },
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
            ),
          ),
        ]
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await ref.read(userProfileViewModelProvider.notifier).getUserInfo();
          showSnackBar(message: 'Refressing...', context: context);
        },
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(20),
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
                SizedBox(
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () async {
                      // Navigate to UpdateProfilePage and wait for a result
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UpdateProfilePage()),
                      );
        
                      // Check if the result is true (profile was updated)
                      if (result == true) {
                        // Refresh the page with the updated user information
                        setState(() {});
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 2,
                        vertical: 3,
                      ),
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Edit Profile',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                itemProfile(userList[0].name, Icons.person),
                const SizedBox(height: 10),
                itemProfile(userList[0].email, Icons.mail),
                const SizedBox(height: 20),
                itemProfile('Logout', Icons.logout),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget itemProfile(String title, IconData iconData) {
    if (iconData == Icons.logout) {
      // Logout button with a different design
      return ElevatedButton(
        onPressed: () {
          ref.read(logoutViewModelProvider.notifier).logout(context);
          // TODO: Implement logout action here
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(iconData),
            const SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
    } else {
      // Regular profile item
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
          title: Text(title),
          leading: Icon(iconData),
          tileColor: Colors.white,
        ),
      );
    }
  }
}
