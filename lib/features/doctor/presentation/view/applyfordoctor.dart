import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/core/common/snackbar/my_snackbar.dart';
import 'package:my_app/features/auth/presentation/viewmodel/auth_view_model.dart';


import '../../../../config/router/app_route.dart';
import '../../domain/entity/doctor_entity.dart';
import '../viewmodel/doctor_view_model.dart';

class ApplyForDoctorView extends ConsumerStatefulWidget {
  const ApplyForDoctorView({Key? key}) : super(key: key);

  @override
  ConsumerState<ApplyForDoctorView> createState() => _ApplyForDoctorViewState();
}

class _ApplyForDoctorViewState extends ConsumerState<ApplyForDoctorView> {
  final _formKey = GlobalKey<FormState>();
  TimeOfDay? selectedTime;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController specializationController = TextEditingController();
  TextEditingController experienceController = TextEditingController();
  TextEditingController feeController = TextEditingController();
  TextEditingController timingController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController statusController = TextEditingController();

  // String selectedTime = '';
  Future<void> _showTimePicker(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        selectedTime = pickedTime;
        timingController.text = selectedTime!.format(context);
      });
    }
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    specializationController.dispose();
    experienceController.dispose();
    feeController.dispose();
    timingController.dispose();
    locationController.dispose();
    statusController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final doctorState = ref.watch(doctorViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apply for Doctor'),
      ),
      body: Container(
        //  decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     colors: [Colors.grey, Colors.grey], // Add your gradient colors
        //     begin: Alignment.topCenter,
        //     end: Alignment.bottomCenter,
        //   ),
        // ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.network(
                    "https://th.bing.com/th/id/R.b80e15c9f07146d61dbcf7a25c134c67?rik=QGaE5P5Lzen7%2fg&riu=http%3a%2f%2fwww.borneomedicalcentre.com%2fen%2fwp-content%2fuploads%2f2017%2f01%2fDoctor-Icon.png&ehk=fzx9nDaf3jEGD7Fkjbax3FSRT4QLJlOt7yt3kubst%2f0%3d&risl=&pid=ImgRaw&r=0",
                    height: 200,
                    width: 200,
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    'Personal Details',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: firstNameController,
                    decoration: InputDecoration(
                      labelText: 'First Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true, // Add a background color to the text field
                      fillColor:
                          Colors.grey[200], // Customize the background color
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 12.0), // Adjust the padding
                      labelStyle: const TextStyle(
                        color: Colors.blue, // Customize the label text color
                        fontWeight: FontWeight
                            .bold, // Add some emphasis to the label text
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: lastNameController,
                    decoration: InputDecoration(
                      labelText: 'Last Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true, // Add a background color to the text field
                      fillColor:
                          Colors.grey[200], // Customize the background color
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 12.0), // Adjust the padding
                      labelStyle: const TextStyle(
                        color: Colors.blue, // Customize the label text color
                        fontWeight: FontWeight
                            .bold, // Add some emphasis to the label text
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true, // Add a background color to the text field
                      fillColor:
                          Colors.grey[200], // Customize the background color
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 12.0), // Adjust the padding
                      labelStyle: const TextStyle(
                        color: Colors.blue, // Customize the label text color
                        fontWeight: FontWeight
                            .bold, // Add some emphasis to the label text
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: phoneController,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true, // Add a background color to the text field
                      fillColor:
                          Colors.grey[200], // Customize the background color
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 12.0), // Adjust the padding
                      labelStyle: const TextStyle(
                        color: Colors.blue, // Customize the label text color
                        fontWeight: FontWeight
                            .bold, // Add some emphasis to the label text
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: addressController,
                    decoration: InputDecoration(
                      labelText: 'Address',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            10.0), // Adjust the border radius as needed
                      ),
                      filled: true, // Add a background color to the text field
                      fillColor:
                          Colors.grey[200], // Customize the background color
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 12.0), // Adjust the padding
                      labelStyle: const TextStyle(
                        color: Colors.blue, // Customize the label text color
                        fontWeight: FontWeight
                            .bold, // Add some emphasis to the label text
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    'Professional Details',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: specializationController,
                    decoration: InputDecoration(
                      labelText: 'Specialization',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true, // Add a background color to the text field
                      fillColor:
                          Colors.grey[200], // Customize the background color
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 12.0), // Adjust the padding
                      labelStyle: const TextStyle(
                        color: Colors.blue, // Customize the label text color
                        fontWeight: FontWeight
                            .bold, // Add some emphasis to the label text
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: experienceController,
                    decoration: InputDecoration(
                      labelText: 'Experience',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true, // Add a background color to the text field
                      fillColor:
                          Colors.grey[200], // Customize the background color
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 12.0), // Adjust the padding
                      labelStyle: const TextStyle(
                        color: Colors.blue, // Customize the label text color
                        fontWeight: FontWeight
                            .bold, // Add some emphasis to the label text
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: feeController,
                    decoration: InputDecoration(
                      labelText: 'Fee',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true, // Add a background color to the text field
                      fillColor:
                          Colors.grey[200], // Customize the background color
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 12.0), // Adjust the padding
                      labelStyle: const TextStyle(
                        color: Colors.blue, // Customize the label text color
                        fontWeight: FontWeight
                            .bold, // Add some emphasis to the label text
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // InkWell(
                  //   onTap: () {
                  //     DatePicker.showTimePicker(
                  //       context,
                  //       showSecondsColumn: false,
                  //       onConfirm: (time) {
                  //         setState(() {
                  //           selectedTime = '${time.hour}:${time.minute}';
                  //           timingController.text = selectedTime;
                  //         });
                  //       },
                  //     );
                  //   },
                  //   child: IgnorePointer(
                  //     child: TextFormField(
                  //       controller: timingController,
                  //       decoration: const InputDecoration(
                  //         labelText: 'Timing',
                  //       ),
                  //     ),
                  //   ),
                  // ),
      
                  // TextFormField(
                  //   controller: timingController,
                  //   decoration: InputDecoration(
                  //     labelText: 'Timing',
                  //     border: const OutlineInputBorder(),
                  //     filled: true, // Add a background color to the text field
                  //     fillColor:
                  //         Colors.grey[200], // Customize the background color
                  //     contentPadding: const EdgeInsets.symmetric(
                  //         vertical: 16.0, horizontal: 12.0), // Adjust the padding
                  //     labelStyle: const TextStyle(
                  //       color: Colors.blue, // Customize the label text color
                  //       fontWeight: FontWeight
                  //           .bold, // Add some emphasis to the label text
                  //     ),
                  //   ),
                  // ),

                  TextFormField(
                          controller: timingController,
                          readOnly: true,
                          onTap: () => _showTimePicker(context),
                          decoration: InputDecoration(
                            labelText: 'Select Time',
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor:Colors.grey[200], // Add a background color to the text field
                          
                            contentPadding: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 12.0), // Adjust the padding
                            labelStyle: const TextStyle(
                            color: Colors.blue, // Customize the label text color
                            fontWeight: FontWeight.bold,),
                            prefixIcon: Icon(Icons.access_time),
                          ),
                        ),
                  // TextFormField(
                  //   controller: statusController,
                  //   decoration: InputDecoration(
                  //     labelText: 'Status',
                  //     border: const OutlineInputBorder(),
                  //     filled: true, // Add a background color to the text field
                  //     fillColor:
                  //         Colors.grey[200], // Customize the background color
                  //     contentPadding: const EdgeInsets.symmetric(
                  //         vertical: 16.0, horizontal: 12.0), // Adjust the padding
                  //     labelStyle: const TextStyle(
                  //       color: Colors.blue, // Customize the label text color
                  //       fontWeight: FontWeight
                  //           .bold, // Add some emphasis to the label text
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 200.0, // Adjust the width as needed
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          DoctorEntity doctor = DoctorEntity(
                              firstName: firstNameController.text,
                              lastName: lastNameController.text,
                              phone: phoneController.text,
                              email: emailController.text,
                              address: addressController.text,
                              specialization: specializationController.text,
                              experience: experienceController.text,
                              feesPerCunsaltation: int.parse(feeController.text),
                              status: statusController.text,
                              timings: timingController.text);
                          ref
                              .read(doctorViewModelProvider.notifier)
                              .addDoctor(doctor);

                          if (doctorState.error != null) {
                          showSnackBar(
                            message: doctorState.error.toString(),
                            context: context,
                            color: Colors.red,
                          );
                        } else {
                          showSnackBar(
                            message: 'Doctor applied successfully',
                            context: context,
                          );
                        }
                        Navigator.pushNamed(context, AppRoute.homeRoute);
      
                          // if(DoctorState.error!=null){
                          //   showSnackBar(message: message, context: context)
                          // }
                        }

      
                        // Add logic to save the appointment and navigate to the confirmation page
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => ConfirmationPage(),
                        //   ),
                        // );
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        // Customize the button text color
                        padding: const EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 24.0), // Adjust the padding
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust the border radius as needed
                        ),
                        elevation: 4.0, // Add a subtle shadow to the button
                      ),
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: 18.0, // Customize the button text size
                          fontWeight: FontWeight
                              .bold, // Add some emphasis to the button text
                        ),
                      ),
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
