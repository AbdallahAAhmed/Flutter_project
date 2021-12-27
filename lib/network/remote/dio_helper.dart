import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper {
  static Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://doctors-app-api-iugaza.herokuapp.com/api/',
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
  }

  static Future<Response> getData({
    @required String url,
    Map<String, dynamic> query,
    String token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    return await dio.get(url);
  }

  static Future<Response> postData({
    @required String url,
    @required Map<String, dynamic> data,
    Map<String, dynamic> query,
    String token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    return dio.post(
      url,
      data: data,
    );
  }

  static Future<Response> postRegisterData({
    @required String url,
    @required Map<String, dynamic> data,
    Map<String, dynamic> query,
    String token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
    };
    return dio.post(
      url,
      data: data,
      options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status < 500;
          }),
    );
  }

  static Future<Response> postCreateData({
    @required String url,
    @required Map<String, dynamic> data,
    Map<String, dynamic> query,
    String token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    return dio.post(
      url,
      data: data,
      options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status < 500;
          }),
    );
  }


  static Future<Response> deleteAppointments({
    @required String url,
    @required String token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    return await dio.deleteUri(
      Uri.parse(url),
      options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status < 500;
          }),
    );
  }
}
