// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:doctorappointment/bloc_observer.dart';
import 'package:doctorappointment/modules/login_cubit/cubit.dart';
import 'package:doctorappointment/network/remote/dio_helper.dart';
import 'package:doctorappointment/network/remote/local/cache_helper.dart';
import 'package:doctorappointment/screens/categories.dart';
import 'package:doctorappointment/screens/doctor_details.dart';
import 'package:doctorappointment/screens/home.dart';
import 'package:doctorappointment/screens/tabs_screen.dart';
import 'package:doctorappointment/screens/login.dart';
import 'package:doctorappointment/screens/onboarding.dart';
import 'package:doctorappointment/screens/profile.dart';
import 'package:doctorappointment/screens/search.dart';
import 'package:doctorappointment/screens/sign_up.dart';
import 'package:doctorappointment/screens/top_doctors_screen.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  BlocOverrides.runZoned(
    () {
      // Use blocs...
      LoginCubit();
    },
    blocObserver: MyBlocObserver(),
  );

  DioHelper.init();
  await CacheHelper.init();
  String route;
  bool onBoarding = CacheHelper.getData(key: 'onBoarding');
  String token = CacheHelper.getData(key: 'token');

  if(onBoarding != null) {
    if(token != null) {
      route = TabsHome.routeName;
    }else {
      route = LoginScreen.routeName;
    }
  }else {
    route = OnboardingScreen.routeName;
  }

  runApp(MyApp(routePage: route,));

}

class MyApp extends StatelessWidget {
  final String routePage;
  const MyApp({Key key, this.routePage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Raleway',
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: routePage,
      routes: {
        OnboardingScreen.routeName: (context) => const OnboardingScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        SignUpScreen.routeName: (context) => const SignUpScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        TopDoctorsScreen.routeName: (context) => const TopDoctorsScreen(),
        CategoriesScreen.routeName: (context) => const CategoriesScreen(),
        ProfileScreen.routeName: (context) => const ProfileScreen(),
        DoctorDetailsScreen.routeName: (context) => const DoctorDetailsScreen(),
        SearchScreen.routeName: (context) => const SearchScreen(),
        TabsHome.routeName: (context) => const TabsHome(),
      },
    );
  }
}
