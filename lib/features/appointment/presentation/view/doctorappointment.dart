import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/features/appointment/domain/entity/appointment_entity.dart';
import 'package:my_app/features/user/domain/use_case/user_use_case.dart';
import 'package:my_app/features/user/presentation/viewmodel/user_profile_view_model.dart';
import '../../../../config/router/app_route.dart';
import '../../../../core/common/snackbar/my_snackbar.dart';
import '../../../doctor/presentation/viewmodel/doctor_view_model.dart';
import '../viewmodel/appointment_view_model.dart';

class DoctorAppointmentPage extends ConsumerStatefulWidget {
  const DoctorAppointmentPage({Key? key}) : super(key: key);

  @override
  ConsumerState<DoctorAppointmentPage> createState() =>
      _DoctorAppointmentPageState();
}

class _DoctorAppointmentPageState extends ConsumerState<DoctorAppointmentPage> {
  final _formKey = GlobalKey<FormState>();
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  Future<void> _showDatePicker(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
        _dateController.text = selectedDate!.toString().substring(0, 10);
      });
    }
  }

  Future<void> _showTimePicker(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        selectedTime = pickedTime;
        _timeController.text = selectedTime!.format(context);
      });
    }
  }

  @override
  void dispose() {
    _dateController.dispose();
    _timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final doctor = ref.watch(doctorViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctor Appointment'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
             padding: const EdgeInsets.symmetric(vertical: 150.0),
            color: const Color.fromARGB(255, 220, 224, 225), // Change the background color
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(30.0), // Reduce padding
                child: SizedBox(
                  height: 380, // Adjust the card height
                  child: Card(
                    elevation: 8.0, // Reduce the card elevation
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0), // Reduce inner padding
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text(
                            'Book Appointment',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                                                
                          const SizedBox(height: 24.0),
                          TextFormField(
                            controller: _dateController,
                            readOnly: true,
                            onTap: () => _showDatePicker(context),
                            decoration: const InputDecoration(
                              labelText: 'Select Date',
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 16.0,
                                horizontal: 12.0,
                              ),
                              prefixIcon: Icon(Icons.calendar_today),
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          TextFormField(
                            controller: _timeController,
                            readOnly: true,
                            onTap: () => _showTimePicker(context),
                            decoration: const InputDecoration(
                              labelText: 'Select Time',
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 16.0,
                                horizontal: 12.0,
                              ),
                              prefixIcon: Icon(Icons.access_time),
                            ),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                AppointmentEntity appointment =
                                    AppointmentEntity(
                                  date: _dateController.text,
                                  time: _timeController.text,
                                );
                                ref
                                    .read(appointmentViewModelProvider.notifier)
                                    .addAppointment(appointment);

                                if (doctor.error != null) {
                                  showSnackBar(
                                    message: doctor.error.toString(),
                                    context: context,
                                    color: Colors.red,
                                  );
                                } else {
                                  showSnackBar(
                                    message: 'Doctor Appointed successfully',
                                    context: context,
                                  );
                                }
                                Navigator.pushNamed(
                                  context,
                                  AppRoute.homeRoute,
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ), // Adjust the padding values
                              backgroundColor: Colors.blueAccent, // New button color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              'Book Now',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
