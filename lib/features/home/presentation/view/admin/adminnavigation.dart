import 'package:flutter/material.dart';
import 'package:my_app/features/home/presentation/view/admin/doctors.dart';
import 'package:my_app/features/user/presentation/view/userlist.dart';
import 'package:my_app/features/home/presentation/view/dashboard.dart';

import '../../../../user/presentation/view/userprofile.dart';

class AdminView extends StatefulWidget {
  const AdminView({super.key});

  @override
  State<AdminView> createState() => _HomeViewState();
}

class _HomeViewState extends State<AdminView> {
  int _selectedIndex = 0;

  List<Widget> screens = [
    const HomePage(),
    const DoctorListPage(),
    const UserListPage(),
    const UserProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_4),
          label: 'Doctor List',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_2),
          label: 'User List',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.white,
      onTap: _onItemTapped,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: _buildBottomNavigationBar(),
      backgroundColor: const Color(0xffF1F4EE),
      body: screens[_selectedIndex],
    );
  }
}
