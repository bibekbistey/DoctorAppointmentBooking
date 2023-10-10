import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/config/router/app_route.dart';
import 'package:my_app/features/home/presentation/viewmodel/home_view_model.dart';
import 'package:my_app/features/user/presentation/viewmodel/user_profile_view_model.dart';

import '../../../appointment/presentation/view/doctorappointment.dart';

class DoctorList extends ConsumerStatefulWidget {
  final String DoctorImage;
  final String doctorname;
  final String doctorspeciality;

  const DoctorList({
    Key? key,
    required this.DoctorImage,
    required this.doctorname,
    required this.doctorspeciality,
  }) : super(key: key);

  @override
  ConsumerState<DoctorList> createState() => _DoctorListState();
}

class _DoctorListState extends ConsumerState<DoctorList> {
  @override
  Widget build(BuildContext context) {
    var DoctorState = ref.watch(homeViewModelProvider);
    var userState=ref.watch(userProfileViewModelProvider);
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.deepPurple[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    AppRoute.appointmentRoute,
                    arguments: userState.users[0].userId,
                  );
                },
                icon: const Icon(Icons.calendar_today),
                color: Colors.deepPurple,
                iconSize: 30,
              ),
            ),
            Center(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      widget.DoctorImage,
                      height: 100,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.doctorname,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(widget.doctorspeciality),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
