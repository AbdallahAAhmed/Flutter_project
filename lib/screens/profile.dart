import 'package:doctorappointment/constraints.dart';
import 'package:doctorappointment/models/dummy_user_appointments.dart';
import 'package:doctorappointment/models/user_appointment.dart';
import 'package:doctorappointment/componenets/user_appointments_card.dart';
import 'package:doctorappointment/network/local/cache_helper.dart';
import 'package:doctorappointment/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = '/profile_page';
  const ProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: Column(
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
                children: const [
                  FaIcon(
                    FontAwesomeIcons.userCircle,
                    color: Colors.white,
                    size: 110,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Fahim Ibne Mawa',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'fahimmawa8@gmail.com',
                    style: TextStyle(
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
                      itemCount: userAppointments.length,
                      itemBuilder: (context, index) {
                        UserAppointment _currentAppointment =
                            userAppointments[index];
                        return UserAppointmentCard(
                          name: _currentAppointment.doctorName,
                          appointmentDate: _currentAppointment.appointmentDate,
                          appointmentTime: _currentAppointment.appointmentTime,
                          image: _currentAppointment.image,
                          rate: _currentAppointment.rate,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: const BottomBar(),
    );
  }
}
