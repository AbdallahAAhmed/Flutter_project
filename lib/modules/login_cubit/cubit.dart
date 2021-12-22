// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:doctorappointment/models/user_data.dart';
import 'package:doctorappointment/modules/login_cubit/states.dart';
import 'package:doctorappointment/network/remote/dio_helper.dart';
import 'package:doctorappointment/network/remote/end_points.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {

  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  UserData userInfo;

  void userLogin(
    {
      @required String email,
      @required String password,
    }
  )
  {
    emit(LoginLoadingState());
    DioHelper.postData(
      url: urlLogin, 
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      userInfo = UserData.fromJson(value.data);
      emit(LoginSuccessState(status: value.statusCode, token: userInfo.token));
    }).catchError((error){
      emit(LoginErrorState(error.toString()));
    });
  }

  bool isPassword = true;
  IconData suffix  = Icons.visibility_outlined;

  void changePasswordVisibility() 
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(LoginPasswordVisibilityState());
  }
  
}