// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:doctorappointment/constraints.dart';
import 'package:doctorappointment/models/user_categories_model.dart';
import 'package:doctorappointment/modules/app_cubit/app_states.dart';
import 'package:doctorappointment/network/remote/dio_helper.dart';
import 'package:doctorappointment/network/remote/end_points.dart';
import 'package:doctorappointment/screens/categories.dart';
import 'package:doctorappointment/screens/home.dart';
import 'package:doctorappointment/screens/profile.dart';
import 'package:doctorappointment/screens/search.dart';
import 'package:doctorappointment/screens/top_doctors_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = 
  [
    const HomeScreen(),
    const TopDoctorsScreen(),
    const SearchScreen(),
    const CategoriesScreen(),
    const ProfileScreen()
  ];

  int currentIndex = 0;

  void changeScreenIndex(int index)
  {
    currentIndex = index;
    emit(AppChangeBottomNavigationState());
  }

  UserCategoriesModel userCategories;

  void getCategoriesData()
  {
    emit(AppLoadingCategoriesDataState());
    DioHelper.getData(
      url: CATEGORIES, 
      token: token,
      ).then((value) {
      userCategories = UserCategoriesModel.fromJson(value.data);
      print(userCategories.data[0].image); 
      emit(AppSuccessCategoriesDataState());
    }).catchError((error){
      print(error.toString());
      emit(AppErrorCategoriesDataState());
    });
  }
}