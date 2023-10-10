import 'package:equatable/equatable.dart';

class AppointmentEntity extends Equatable {
  final String? userId;
  final String? doctorId;
  
  final String date;
  final String time;

  const AppointmentEntity({
    this.userId,
    this.doctorId,
    
    required this.date,
    required this.time,
  });

  factory AppointmentEntity.fromJson(Map<String, dynamic> json) =>
      AppointmentEntity(
        userId: json["userId"],
        doctorId: json["doctorId"],
        
        date: json["date"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "userId":userId,
        "doctorId":doctorId,
        "date": date,
        "time": time,
      };

  @override
  String toString() {
    return 'BatchEntity(userId:$userId,doctorId:$doctorId,date: $date, time: $time)';
  }

  @override
  List<Object?> get props => [userId,doctorId,date, time];
}





// import 'package:equatable/equatable.dart';

// class AppointmentEntity extends Equatable{
//     Id id;
//     String userId;
//     DateTime date;
//     String status;
//     DateTime time;
//     int v;

//     AppointmentEntity({
//         required this.id,
//         required this.userId,
//         required this.date,
//         required this.status,
//         required this.time,
//         required this.v,
//     });

//     factory AppointmentEntity.fromJson(Map<String, dynamic> json) => AppointmentEntity(
//         id: Id.fromJson(json["_id"]),
//         userId: json["userId"],
//         date: DateTime.parse(json["date"]),
//         status: json["status"],
//         time: DateTime.parse(json["time"]),
//         v: json["__v"],
//     );

//     Map<String, dynamic> toJson() => {
//         "_id": id.toJson(),
//         "userId": userId,
//         "date": date.toIso8601String(),
//         "status": status,
//         "time": time.toIso8601String(),
//         "__v": v,
//     };

//       @override
//   List<Object?> get props => [id,userId,date,status,time];
// }



// class Id {
//     String oid;

//     Id({
//         required this.oid,
//     });

//     factory Id.fromJson(Map<String, dynamic> json) => Id(
//         oid: json["\u0024oid"],
//     );

//     Map<String, dynamic> toJson() => {
//         "\u0024oid": oid,
//     };
// }
