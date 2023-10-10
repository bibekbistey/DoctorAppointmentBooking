import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/features/user/domain/entity/user_entity.dart';
import 'package:my_app/features/user/presentation/viewmodel/user_view_model.dart';

import '../../../../core/common/snackbar/my_snackbar.dart';

class User {
  final String fullName;
  final String email;
  final String doctor;

  User({required this.fullName, required this.email, required this.doctor});
}

class UserListPage extends ConsumerStatefulWidget {
  const UserListPage({super.key});

  @override
  ConsumerState<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends ConsumerState<UserListPage> {
 

  @override
  Widget build(BuildContext context) {
    var UserState=ref.watch(userViewModelProvider);
    List<UserEntity>userList=UserState.users;

    if (userList.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(), // Show loader
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List',style: TextStyle(color: Colors.amber,fontSize:25,fontWeight: FontWeight.bold),),
        // title: const Text(
        //   'User List',
        //   style: TextStyle(
        //       fontSize: 20,
        //       fontWeight: FontWeight.bold,
        //       color: Colors.blueGrey),
        // ),
        // backgroundColor: Colors.transparent,
      ),
      body: RefreshIndicator(
         onRefresh: () async {
          await ref.read(userViewModelProvider.notifier).getAllUsers();
          showSnackBar(message: 'Refressing...', context: context);
        },
        child: ListView.builder(
          itemCount: userList.length,
          itemBuilder: (context, index) {
            final user = userList[index];
            return Card(
              elevation: 2,
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListTile(
                title: Text(
                  userList[index].email,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  userList[index].name,
                  // 'Status: ${doctor.email}\nPhone: ${doctor.doctor}',
                  style: const TextStyle(fontSize: 14),
                ),
                trailing: Wrap(
                  spacing: 8,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if(user.userId!=null){
                          ref.read(userViewModelProvider.notifier).deleteUser(context,user);
                        }else{
                          showSnackBar(
                            message: 'User ID is null',
                            context: context,
                            color: Colors.red,
                          );
                        }
                        
                        
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical:
                                8), // Adjust the padding to make the button smaller
                        textStyle: const TextStyle(
                            fontSize:
                                14), // Adjust the font size of the button text
                        backgroundColor: Colors
                            .red, // Use a red background color for delete button
                      ),
                      child: const Text('Delete'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
