import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/features/appointment/domain/entity/appointment_entity.dart';
import 'package:my_app/features/appointment/presentation/viewmodel/appointment_view_model.dart';

import '../../../../core/common/snackbar/my_snackbar.dart';

class AppointmentView extends ConsumerStatefulWidget {
  const AppointmentView({super.key});

  @override
  ConsumerState<AppointmentView> createState() => _AppointmentViewState();
}

class _AppointmentViewState extends ConsumerState<AppointmentView> {
  @override
  Widget build(BuildContext context) {
    var AppointmentState = ref.watch(appointmentViewModelProvider);
    List<AppointmentEntity> appointmentList = AppointmentState.appointments;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointments'),
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       ref.read(appointmentViewModelProvider.notifier).getAppointments();
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
          await ref.read(appointmentViewModelProvider.notifier).getAppointments();
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
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Your Appointments',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.cyan,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Expanded(
                  child: ListView.builder(
                    itemCount: appointmentList.length,
                    itemBuilder: (context, index) {
                      final appointment = appointmentList[index];
                      return AppointmentCard(
                        date: appointment.date,
                        time: appointment.time,
                        status: "approved",
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AppointmentCard extends StatefulWidget {
  final String date;
  final String time;
  final String status;

  const AppointmentCard({
    super.key,
    required this.date,
    required this.time,
    required this.status,
  });

  @override
  State<AppointmentCard> createState() => _AppointmentCardState();
}

class _AppointmentCardState extends State<AppointmentCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      width: 500, // Adjust the height as per your preference
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.date,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.time,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.status,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
