import 'package:doctorappointment/models/user_categories_model.dart';

class TopDoctors 
{
  String status;
  Data data;

  TopDoctors.fromJson(Map<String, dynamic> json) 
  {
    status = json['status'];
    data = Data.fromJson(json['data']);
  }
}

class Data 
{
  int limit;
  int total;
  List<Results>  results = [];
  int pages;
  int current;

  Data.fromJson(Map<String, dynamic> json)
  {
    limit = json['limit'];
    total = json['total'];
    json['results'].forEach((element){
      results.add(Results.fromJson(element));
    });
    pages = json['pages'];
    current = json['current'];
  }
}

class Results 
{
  List<String> times;
  String id1;
  String name;
  String phone;
  String image;
  String price;
  double rate;
  String categoryId;
  String createdAt;
  String updatedAt;
  int v;
  UserDataCategoriesModel category;
  String id;

  Results.fromJson(Map<String, dynamic> json)
  {
    times = json['times'].cast<String>();
    id1 = json['_id'];
    name = json['name'];
    phone = json['phone'];
    image = json['image'];
    price = json['price'];
    rate = json['rate'];
    categoryId = json['categoryId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    category = UserDataCategoriesModel.fromJson(json['category']);
    id = json['id'];
  }
}