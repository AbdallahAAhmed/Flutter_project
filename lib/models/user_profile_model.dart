class UserProfileModel 
{
  String id1;
  String email;
  String name;
  String password;
  String createdAt;
  String updatedAt;
  int v;
  String id;

  UserProfileModel.fromJson(Map<String, dynamic> json) 
  {
    id1 = json['_id'];
    email = json['email'];
    name = json['name'];
    password = json['password'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    id = json['id'];
  }
}