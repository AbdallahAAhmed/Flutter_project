class RegisterModel 
{
  bool success;
  String message;

  RegisterModel.fromJson(Map<String, dynamic> json)
  {
    success = json['success'];
    message = json['message'];
  } 
}