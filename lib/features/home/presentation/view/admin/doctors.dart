import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/features/home/domain/entity/home_entity.dart';


import '../../../../../core/common/snackbar/my_snackbar.dart';
import '../../state/home_state.dart';
import '../../viewmodel/doctor_list_view_model.dart';
import '../../viewmodel/home_view_model.dart';

class Doctor {
  final String fullName;
  final String status;
  final String phoneNumber;

  Doctor({
    required this.fullName,
    required this.status,
    required this.phoneNumber,
  });
}

class DoctorListPage extends ConsumerStatefulWidget {
  const DoctorListPage({super.key});

  @override
  ConsumerState<DoctorListPage> createState() => _DoctorListPageState();
}

class _DoctorListPageState extends ConsumerState<DoctorListPage> {
  

  @override
  Widget build(BuildContext context) {
    var HomeState = ref.watch(doctorListViewModelProvider);
    List<HomeEntity>doctorList=HomeState.doctors;   

    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctor List',style: TextStyle(color: Colors.amber,fontSize:25,fontWeight: FontWeight.bold),),
        // backgroundColor: Colors.black,
        elevation: 2,
      ),
      body: RefreshIndicator(
         onRefresh: () async {
          await ref.read(doctorListViewModelProvider.notifier).getAllDoctorList();
          showSnackBar(message: 'Refressing...', context: context);
        },
        child: ListView.builder(
          itemCount: doctorList.length,
          itemBuilder: (context, index) {
            final doctor = doctorList[index];
            return Card(
              elevation: 2,
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListTile(
                title: Text(
                  "${doctorList[index].firstName} ${doctorList[index].lastName}", // Assuming "firstName" and "lastName" properties exist in DoctorEntity
                    style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'Email: ${doctorList[index].email}\nStatus: ${doctorList[index].status}',
                  style: const TextStyle(fontSize: 14),
                ),
                trailing: Wrap(
                  spacing: 8,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                      
                        if(doctor.userId!=null){
                          ref.read(homeViewModelProvider.notifier).approveDoctor(context, doctor.userId!,"approved");
                        }else{
                          showSnackBar(
                            message: 'User ID is null',
                            context: context,
                            color: Colors.red,
                          );
                        }
                        // TODO: Implement approved button action
                        print('Approved');
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        textStyle: const TextStyle(fontSize: 14),
                      ),
                      child: const Text('Approve'),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        if(doctor.userId!=null){
                          ref.read(doctorListViewModelProvider.notifier).deleteDoctor(context,doctor);
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

