import 'list_doctors_by_top_rate.dart';

class DoctorDetailModel 
{
  String status;
  Results data;

  DoctorDetailModel.fromJson(Map<String, dynamic> json)
  {
    status = json['status'];
    data = Results.fromJson(json['data']);
  }
}