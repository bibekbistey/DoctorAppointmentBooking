import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:my_app/features/home/data/model/home_hive_model.dart';
import 'package:path_provider/path_provider.dart';

import '../../../config/constants/hive_table_constant.dart';
import '../../../features/auth/data/model/auth_hive_model.dart';


final hiveServiceProvider = Provider<HiveService>((ref) => HiveService());

class HiveService {
  Future<void> init() async {
    var directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);

    // Register Adapters
    Hive.registerAdapter(AuthHiveModelAdapter());
    Hive.registerAdapter(HomeHiveModelAdapter());

    // Add dummy data
    // await addDummyDoctor();
  }

//   // ======================== Doctor Queries ========================
//   Future<void> addDoctor(DoctorHiveModel Doctor) async {
//     var box = await Hive.openBox<DoctorHiveModel>(HiveTableConstant.doctorBox);
//     await box.put(Doctor.userId, Doctor);
//   }

//   Future<List<DoctorHiveModel>> getAllDoctores() async {
//     var box = await Hive.openBox<DoctorHiveModel>(HiveTableConstant.doctorBox);
//     var Doctores = box.values.toList();
//     box.close();
//     return Doctores;
//   }

//   // // ======================== Course Queries ========================
//   // Future<void> addCourse(CourseHiveModel course) async {
//   //   var box = await Hive.openBox<CourseHiveModel>(HiveTableConstant.courseBox);
//   //   await box.put(course.courseId, course);
//   // }

//   // Future<List<CourseHiveModel>> getAllCourses() async {
//   //   var box = await Hive.openBox<CourseHiveModel>(HiveTableConstant.courseBox);
//   //   var courses = box.values.toList();
//   //   box.close();
//   //   return courses;
//   // }

//   // ======================== Student Queries ========================
  Future<void> addStudent(AuthHiveModel student) async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.studentBox);
    await box.put(student.studentId, student);
  }

  Future<List<AuthHiveModel>> getAllStudents() async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.studentBox);
    var students = box.values.toList();
    box.close();
    return students;
  }

  // Login
  Future<AuthHiveModel?> login(String email, String password) async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.studentBox);
    var student = box.values.firstWhere(
        (element) => element.email == email && element.password == password);
    box.close();
    return student;
  }


  Future<List<HomeHiveModel>> getAllDoctors() async {
    var box = await Hive.openBox<HomeHiveModel>(HiveTableConstant.doctorBox);
    var doctors = box.values.toList();
    box.close();
    return doctors;
  }


//   // ======================== Insert Dummy Data ========================
//   // Doctor Dummy Data
//   Future<void> addDummyDoctor() async {
//     // check of Doctor box is empty
//     var box = await Hive.openBox<DoctorHiveModel>(HiveTableConstant.doctorBox);
//     if (box.isEmpty) {
//       final doctor1 = DoctorHiveModel(firstName: '29-A',lastName:"ewdf",phone: "",email: "",experience: "",specialization: "",website: "",feesPerCunsaltation: "",status: "",timings: "",address: "");
//       final doctor2 = DoctorHiveModel(firstName: '29-A',lastName:"ewdf",phone: "",email: "",experience: "",specialization: "",website: "",feesPerCunsaltation: "",status: "",timings: "",address: "");
//       final doctor3 = DoctorHiveModel(firstName: '29-A',lastName:"ewdf",phone: "",email: "",experience: "",specialization: "",website: "",feesPerCunsaltation: "",status: "",timings: "",address: "");

//       List<DoctorHiveModel> Doctores = [doctor1, doctor2, doctor3, ];

//       // Insert Doctor with key
//       for (var Doctor in Doctores) {
//         await addDoctor(Doctor);
//       }
//     }
//   }

//   // Future<void> addDummyCourse() async {
//   //   // check of course box is empty
//   //   var box = await Hive.openBox<CourseHiveModel>(HiveTableConstant.courseBox);
//   //   if (box.isEmpty) {
//   //     final course1 = CourseHiveModel(courseName: 'Flutter');
//   //     final course2 = CourseHiveModel(courseName: 'Dart');
//   //     final course3 = CourseHiveModel(courseName: 'Java');
//   //     final course4 = CourseHiveModel(courseName: 'Kotlin');

//   //     List<CourseHiveModel> courses = [course1, course2, course3, course4];

//   //     // Insert course with key
//   //     for (var course in courses) {
//   //       await addCourse(course);
//   //     }
//   //   }
//   // }

//   // ======================== Delete All Data ========================
//   Future<void> deleteAllData() async {
//     var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.studentBox);
//     await box.clear();
//   }

//   // ======================== Close Hive ========================
//   Future<void> closeHive() async {
//     await Hive.close();
//   }

//   // ======================== Delete Hive ========================
//   Future<void> deleteHive() async {
//     var directory = await getApplicationDocumentsDirectory();
//     Hive.init(directory.path);
//     // await Hive.deleteBoxFromDisk(HiveTableConstant.studentBox);
//     await Hive.deleteBoxFromDisk(HiveTableConstant.doctorBox);
//     // await Hive.deleteBoxFromDisk(HiveTableConstant.courseBox);
//     await Hive.deleteFromDisk();
//   }
}
