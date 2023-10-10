import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/features/appointment/presentation/view/doctorappointment.dart';
import 'package:my_app/features/home/presentation/view/category.dart';
import 'package:my_app/features/home/presentation/view/doctorlist.dart';
import 'package:my_app/features/home/presentation/viewmodel/logout_view_model.dart';
import 'package:shake/shake.dart';

import '../../../../core/common/provider/internet_connectivity.dart';
import '../../../../core/common/snackbar/my_snackbar.dart';
import '../../domain/entity/home_entity.dart';
import '../viewmodel/home_view_model.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  late ShakeDetector detector;

  @override
  void initState() {
    super.initState();
    detector = ShakeDetector.autoStart(
      onPhoneShake: () {
        ref.read(logoutViewModelProvider.notifier).logout(context);
      },
      minimumShakeCount: 1,
      shakeSlopTimeMS: 500,
      shakeCountResetTime: 3000,
      shakeThresholdGravity: 6,
    );
    // ShakeDetector.waitForStart() waits for user to call detector.startListening();
  }

  @override
  void dispose() {
    super.dispose();
    detector.stopListening();
  }
  @override
  Widget build(BuildContext context) {
    var DoctorState = ref.watch(homeViewModelProvider);
    var internetState = ref.watch(connectivityStatusProvider);
    List<HomeEntity> homeList = DoctorState.doctors;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard',style: TextStyle(color: Colors.amber,fontSize:20,fontWeight: FontWeight.bold),),
        // backgroundColor: Colors.transparent,
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       ref.read(homeViewModelProvider.notifier).getAllDoctors();
        //       // ref.read(courseViewModelProvider.notifier).getCourses();
        //       showSnackBar(message: 'Refressing...', context: context);
        //     },
        //     icon: const Icon(
        //       Icons.refresh,
        //       color: Colors.white,
        //     ),
        //   ),
        // ]
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await ref.read(homeViewModelProvider.notifier).getAllDoctors();
          showSnackBar(message: 'Refressing...', context: context);
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.black], // Add your gradient colors
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 15,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Hello, \nWelcome',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          // fontFamily: 'OpenSans',
                          fontSize: 30,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          ref.read(logoutViewModelProvider.notifier).logout(context);
                        },
                        icon: const Icon(
                          Icons.logout,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  //   child: Container(
                  //     padding: const EdgeInsets.all(0),
                  //     decoration: BoxDecoration(
                  //       color: Colors.deepPurple[100],
                  //       borderRadius: BorderRadius.circular(25),
                  //     ),
                  //     child: TextFormField(
                  //       decoration: const InputDecoration(
                  //         border: InputBorder.none,
                  //         prefixIcon: Icon(Icons.search),
                  //         labelText: 'Search',
                  //         hintText: 'Search Doctors',
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 25,
                  ),
                  // Category
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Category',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 80,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        CategoryScreen(
                          categoryName: 'Dentist',
                          iconImage:
                              'https://static.thenounproject.com/png/100330-200.png',
                        ),
                        CategoryScreen(
                          categoryName: 'Surgeon',
                          iconImage:
                              'https://cdn-icons-png.flaticon.com/512/5793/5793639.png',
                        ),
                        CategoryScreen(
                          categoryName: 'Cardiologist',
                          iconImage:
                              'https://cdn-icons-png.flaticon.com/512/3467/3467794.png',
                        ),
                        CategoryScreen(
                          categoryName: 'Therapist',
                          iconImage:
                              'https://cdn-icons-png.flaticon.com/512/1971/1971437.png',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
        
                  ///Doctor List
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Doctor List',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Expanded(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: homeList.length,
            itemBuilder: (context, index) {
          return Column(
            children: [
              DoctorList(
                DoctorImage: 'https://th.bing.com/th/id/OIP.xf9TkDAN4uIhHezoIacDhQHaHk?pid=ImgDet&w=920&h=940&rs=1',
                doctorname: "${homeList[index].firstName} ${homeList[index].lastName}",
                doctorspeciality: homeList[index].specialization,
              ),
              SizedBox(height: 15), // Add space after each doctor list
            ],
          );
            },
          ),
        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
