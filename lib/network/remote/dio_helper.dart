import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper 
{
  static Dio dio;

  static init() 
  {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://doctors-app-api-iugaza.herokuapp.com/api/',
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type':'application/json',
        },
      ),
    );
  }

  static Future<Response> postData (
    {
      @required String url,
      @required Map<String, dynamic> data,
      Map<String, dynamic> query,
      String token,
    }
    ) async
    {
      dio.options.headers = {
        'Authorization': token,
      };
      return dio.post(
        url,
        data: data,
      );
    }


    static Future<Response> getData({
      @required String url,
      Map<String, dynamic> query,
      String token,
    }) async
    {
      dio.options.headers = {
        'Authorization': token,
      };
      return await dio.get(url, queryParameters: query);
    }

}