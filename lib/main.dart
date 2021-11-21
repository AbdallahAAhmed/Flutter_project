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

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Raleway',
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: OnboardingScreen.routeName,
      routes: {
        OnboardingScreen.routeName: (context) => const OnboardingScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        SignUpScreen.routeName: (context) => const SignUpScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
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
