import 'package:bloc/bloc.dart';
import 'package:doctorappointment/constraints.dart';
import 'package:doctorappointment/models/doctor_details_model.dart';
import 'package:doctorappointment/modules/doctor_details/states.dart';
import 'package:doctorappointment/network/remote/dio_helper.dart';
import 'package:doctorappointment/network/remote/end_points.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorsDetailsCubit extends Cubit<DoctorsDetailsStates> 
{
  DoctorsDetailsCubit() : super(DoctorsDetailsInitialState());

  static DoctorsDetailsCubit get(context) => BlocProvider.of(context);

  DoctorDetailModel doctorDetails;

  void getDoctorsDetails({String id})
  {
    emit(DoctorsDetailsLoadingState());

    DioHelper.getData(
      url: doctorsDetailsUrl(id),
      token: token,
    ).then((value) {
      doctorDetails = DoctorDetailModel.fromJson(value.data);
      print(doctorDetails.data.name);
      emit(DoctorsDetailsSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(DoctorsDetailsErrorState());
    });
  }


  void createUserAppointments({
    @required String doctorId,
    @required String time,
    @required String day,
  }) async 
  {
    emit(AppLoadingCreateUserAppointmentsState());
    DioHelper.postCreateData(
      url: CREATE_APPOINTMENT,
      token: token,
      data: {
        "doctorId": doctorId,
        "time": time,
        "day": day,
      },
    ).then((value) {
      print(value.data);
      emit(AppSuccessCreateUserAppointmentsState());
    }).catchError((error){
      print(error.toString());
      emit(AppErrorCreateUserAppointmentsState());
    });
  }



  bool isClicked = false;
  Color color = backGroundColor;
  Color colorText = const Color(0xff8C8FA5);

  void changeTimeButton()
  {
    isClicked = !isClicked;
    color = isClicked ? mainColor : backGroundColor;
    colorText = isClicked ? Colors.white : const Color(0xff8C8FA5);
    emit(DoctorDetailChangeColor());
  }
}