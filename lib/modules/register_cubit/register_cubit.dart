import 'package:bloc/bloc.dart';
import 'package:doctorappointment/models/register_model.dart';
import 'package:doctorappointment/modules/register_cubit/register_states.dart';
import 'package:doctorappointment/network/remote/dio_helper.dart';
import 'package:doctorappointment/network/remote/end_points.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterStates> 
{
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  RegisterModel registerModel;

  Future<void> userRegister (
    {
      @required String email,
      @required String password,
      @required String name,
      @required String passwordConfirmation,
    })
  async {
   
    emit(RegisterLoadingState());

    DioHelper.postRegisterData
    (
      url: urlRegister, 
      data: 
      {
        'email': email,
        'password': password,
        'name': name,
        'password_confirmation': passwordConfirmation,
      },
    
    ).then((value) 
    {
      registerModel = RegisterModel.fromJson(value.data);
      print(registerModel.message);
      emit(RegisterSuccessState(registerModel));
    }).catchError((error)
    {
      emit(RegisterErrorState(error.toString()));
    });
  }

  bool isPassword = true;
  IconData suffix  = Icons.visibility_outlined;

  bool isPasswordConfirm = true;
  IconData suffixConfirm  = Icons.visibility_outlined;

  void changePasswordVisibility() 
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(RegisterPasswordVisibilityState());
  }

  void changePasswordConfirmVisibility() 
  {
    isPasswordConfirm = !isPasswordConfirm;
    suffixConfirm = isPasswordConfirm ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(RegisterPasswordVisibilityState());
  }
}