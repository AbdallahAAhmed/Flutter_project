import 'package:doctorappointment/models/list_doctors_by_top_rate.dart';

class UserAppointmentModel 
{
  String status;
  UserAppointmentData data;

  UserAppointmentModel.fromJson(Map<String, dynamic> json)
  {
    status = json['status'];
    data = UserAppointmentData.fromJson(json['data']);
  }
}


class UserAppointmentData 
{
  List<UserAppointmentResults> results = [];

  UserAppointmentData.fromJson(Map<String, dynamic> json) 
  {
    json['results'].forEach((element){
      results.add(UserAppointmentResults.fromJson(element));
    });
  }
}

class UserAppointmentResults
{
  String id1;
  String userId;
  String doctorId;
  String time;
  String day;
  String createdAt;
  String updatedAt;
  int v;
  Results doctor;
  String id;

  UserAppointmentResults.fromJson(Map<String, dynamic> json) 
  {
    id1 = json['_id'];
    userId = json['userId'];
    doctorId = json['doctorId'];
    time = json['time'];
    day = json['day'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    doctor = Results.fromJson(json['doctor']);
    id = json['id'];

  }
}