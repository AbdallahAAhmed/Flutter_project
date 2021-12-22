class UserCategoriesModel 
{
  String status;
  List<UserDataCategoriesModel> data = [];

  UserCategoriesModel.fromJson(Map<String, dynamic> json)
  {
    status = json['status'];
    json['data'].forEach((element)
    {
      data.add( UserDataCategoriesModel.fromJson(element));
    });
  }
}

class UserDataCategoriesModel 
{
  String id1;
  String name;
  String image;
  String createdAt;
  String updatedAt;
  int v;
  String id;

   UserDataCategoriesModel.fromJson(Map<String, dynamic> json)
   {
     id1 = json['_id'];
     name = json['name'];
     image = json['image'];
     createdAt = json['createdAt'];
     updatedAt = json['updatedAt'];
     v = json['__v'];
     id = json['id'];
   }
}