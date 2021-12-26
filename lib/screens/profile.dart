import 'package:doctorappointment/constraints.dart';
import 'package:doctorappointment/componenets/user_appointments_card.dart';
import 'package:doctorappointment/modules/app_cubit/app_cubit.dart';
import 'package:doctorappointment/modules/app_cubit/app_states.dart';
import 'package:doctorappointment/network/local/cache_helper.dart';
import 'package:doctorappointment/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = '/profile_page';
  const ProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) 
      {
        AppCubit cubit = AppCubit.get(context);

        return Scaffold(
        backgroundColor: backGroundColor,
        appBar: AppBar(
          title: const Text(
            'Profile',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: mainColor,
          elevation: 0.0,
          actions: [
            TextButton(
              onPressed: () 
              {
                CacheHelper.removeData(key: 'token').then((value) {
                  if(value){
                    Navigator.of(context).popAndPushNamed(LoginScreen.routeName);
                  }
                });
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Text(
                  'Log out',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: cubit.userProfile != null 
        ? Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const FaIcon(
                      FontAwesomeIcons.userCircle,
                      color: Colors.white,
                      size: 110,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      cubit.userProfile.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      cubit.userProfile.email,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 32),
                child: Column(
                  children: [
                    const Text(
                      'My Appointments',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: mainColor,
                      ),
                    ),
                    const SizedBox(height: 25),
                    Expanded(
                      child: ListView.builder(
                        itemCount: cubit.userAppointments.data.results.length,
                        itemBuilder: (context, index) {
                          var _currentAppointment =
                              cubit.userAppointments.data.results[index];
                          return UserAppointmentCard(
                            name: _currentAppointment.doctor.name,
                            appointmentDate: _currentAppointment.day,
                            appointmentTime: _currentAppointment.time,
                            image: _currentAppointment.doctor.image,
                            rate: _currentAppointment.doctor.rate,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
        : const Center(child: CircularProgressIndicator()),
      );
      }
    );
  }
}
