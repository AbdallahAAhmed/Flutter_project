// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:doctorappointment/bloc_observer.dart';
import 'package:doctorappointment/constraints.dart';
import 'package:doctorappointment/modules/app_cubit/app_cubit.dart';
import 'package:doctorappointment/modules/doctor_details/cubit.dart';
import 'package:doctorappointment/modules/login_cubit/cubit.dart';
import 'package:doctorappointment/modules/register_cubit/register_cubit.dart';
import 'package:doctorappointment/network/local/cache_helper.dart';
import 'package:doctorappointment/network/remote/dio_helper.dart';
import 'package:doctorappointment/screens/categories.dart';
import 'package:doctorappointment/screens/doctor_details.dart';
import 'package:doctorappointment/screens/doctors_by_category.dart';
import 'package:doctorappointment/screens/home.dart';
import 'package:doctorappointment/screens/tabs_screen.dart';
import 'package:doctorappointment/screens/login.dart';
import 'package:doctorappointment/screens/onboarding.dart';
import 'package:doctorappointment/screens/profile.dart';
import 'package:doctorappointment/screens/search.dart';
import 'package:doctorappointment/screens/sign_up.dart';
import 'package:doctorappointment/screens/top_doctors_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  BlocOverrides.runZoned(
    () {
      // Use blocs...
      LoginCubit();
      AppCubit();
      RegisterCubit();
    },
    blocObserver: MyBlocObserver(),
  );

  DioHelper.init();
  await CacheHelper.init();
  String route;
  bool onBoarding = CacheHelper.getData(key: 'onBoarding');
  token = CacheHelper.getData(key: 'token');

  if (onBoarding != null) {
    if (token != null) {
      route = TabsHome.routeName;
    } else {
      route = LoginScreen.routeName;
    }
  } else {
    route = OnboardingScreen.routeName;
  }

  runApp(MyApp(
    routePage: route,
  ));
}

class MyApp extends StatelessWidget {
  final String routePage;
  const MyApp({Key key, this.routePage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) => AppCubit()
              ..getCategoriesData()
              ..getTopDoctorRate()
              ..getDoctors()
              ..getUserProfile()
              ..getUserAppointments()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Raleway',
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: routePage,
        routes: {
          OnboardingScreen.routeName: (context) => const OnboardingScreen(),
          LoginScreen.routeName: (context) => const LoginScreen(),
          SignUpScreen.routeName: (context) => SignUpScreen(),
          HomeScreen.routeName: (context) => const HomeScreen(),
          TopDoctorsScreen.routeName: (context) => const TopDoctorsScreen(),
          CategoriesScreen.routeName: (context) => const CategoriesScreen(),
          ProfileScreen.routeName: (context) => const ProfileScreen(),
          DoctorDetailsScreen.routeName: (context) =>
              const DoctorDetailsScreen(),
          SearchScreen.routeName: (context) => const SearchScreen(),
          TabsHome.routeName: (context) => const TabsHome(),
          DoctorsByCategory.routeName: (context) => const DoctorsByCategory(),
        },
      ),
    );
  }
}
