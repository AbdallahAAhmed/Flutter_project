// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:doctorappointment/constraints.dart';
import 'package:doctorappointment/models/user_apointment_model.dart';
import 'package:doctorappointment/models/user_profile_model.dart';
import 'package:doctorappointment/modules/profile_cubit/states.dart';
import 'package:doctorappointment/network/remote/dio_helper.dart';
import 'package:doctorappointment/network/remote/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileStates>
{
  ProfileCubit() : super(AppProfileInitialState());

  static ProfileCubit get(context) => BlocProvider.of(context);

   UserProfileModel userProfile;

  void getUserProfile() 
  {
    DioHelper.getData(
      url: PROFILE,
      token: token,
      ).then((value) 
      {
        userProfile = UserProfileModel.fromJson(value.data);
        emit(AppSuccessUserProfileDataState());
      }).catchError((error)
      {
        print(error.toString());
        emit(AppErrorUserProfileDataState());
      });
  }

  UserAppointmentModel userAppointments;

  void getUserAppointments()
  {
    emit(AppLoadingUserAppointmentsState());
    DioHelper.getData(
      url: USER_APPOINTMENT,
      token: token,
    ).then((value) 
    {
      userAppointments = UserAppointmentModel.fromJson(value.data);
      print(userAppointments.data.results[0].day);
      print(userAppointments.data.results[0].time);
      emit(AppSuccessUserAppointmentsState());
    }).catchError((error)
    {
      print(error.toString());
      emit(AppErrorUserAppointmentsState());
    });
  }

  void deleteUserAppointments({String id}) {
    emit(AppLoadingDeleteUserAppointmentsState());
    DioHelper.deleteAppointments(
      url: deleteUserAppointmentsUrl(id),
      token: token,
    ).then((value) {
      print('success');
      emit(AppSuccessDeleteUserAppointmentsState());
    }).catchError((error){
      print(error.toString());
      emit(AppErrorDeleteUserAppointmentsState());
    });
  }
}