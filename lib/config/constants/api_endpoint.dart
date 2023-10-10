class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);
  // static const String baseUrl = "http://10.0.2.2:8080/api/v1/";
  // static const String baseUrl = "http://192.168.137.1:8080/api/v1/";
  static const String baseUrl = "http://192.168.1.65:8080/api/v1/";

  // ====================== Auth Routes ======================
  static const String login = "user/login";
  static const String register = "user/register";
  // get all doctors
  static const String getAllDoctors = "user/getAllDoctors";

  //apply for doctor
  static const String addDoctor = "user/apply-doctor";

  // book appointment
  static const String addAppointment = "user/appointment";

  // get user profile
  static const String getUserInfo="user/getUserData";

  //get user list
  static const String getAllUsers="admin//getAllUsers";

  //get doctor list
  static const String getAllDoctorList = "admin/getAllDoctors";

  //delete users
  static const String deleteUser="admin/deleteUsers/";

  // delete doctors
  static const String deleteDoctor="admin/deleteDoctors/";

  //approve doctor
  static String approveDoctor(String userId,String status)=>"admin/changeAccountStatus";

  //edit profile
  static const String editProfile="user/updateprofile";
  
  //get appointments
  static const String getAppointments="user/appointments/";


}
