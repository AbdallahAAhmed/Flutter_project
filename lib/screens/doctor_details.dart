import 'package:doctorappointment/constraints.dart';
import 'package:doctorappointment/models/dummy_doctors.dart';
import 'package:doctorappointment/widgets/calender_card.dart';
import 'package:doctorappointment/widgets/check_appointment_time.dart';
import 'package:doctorappointment/widgets/doctor_details_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DoctorDetailsScreen extends StatelessWidget {
  static const String routeName = '/doctor_details_page';
  const DoctorDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _doctorId = ModalRoute.of(context)!.settings.arguments as String?;
    final _selectedDoctor =
        doctors.firstWhere((doctor) => doctor.id == _doctorId);
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black)),
      body: Column(
        children: [
          Container(
            padding:
                const EdgeInsets.only(right: 32, left: 32, top: 10, bottom: 50),
            child: DoctorDetailsCard(
              name: _selectedDoctor.name,
              category: _selectedDoctor.department,
              hospitalName: _selectedDoctor.hospitalName,
              image: _selectedDoctor.image,
              rate: _selectedDoctor.rate,
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 50, horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CircleAvatar(
                              backgroundColor:
                                  Color.fromRGBO(255, 255, 255, 2.5),
                              radius: 30.0,
                              child: FaIcon(FontAwesomeIcons.users,
                                  color: Colors.white),
                            ),
                            const SizedBox(width: 15),
                            Column(
                              children: [
                                Text(
                                  '${_selectedDoctor.patientsCount}+',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                const Text(
                                  'Pateints',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const CircleAvatar(
                              backgroundColor:
                                  Color.fromRGBO(255, 255, 255, 2.5),
                              radius: 30.0,
                              child: FaIcon(FontAwesomeIcons.award,
                                  color: Colors.white),
                            ),
                            const SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${_selectedDoctor.experienceYears} Years',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                const Text(
                                  'Experiance',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(
                          right: 32, left: 32, top: 32, bottom: 20),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'About Doctor',
                                style: TextStyle(
                                  color: textColor,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Dr. ${_selectedDoctor.name} is the top most cardiologist specialist in Dhaka Medical College hospital at Dhaka.He achived several award for his wonderful contribution in her own field.He is available for private consultation.',
                                style: const TextStyle(
                                  color: textColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Book Time',
                                style: TextStyle(
                                  color: textColor,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 15),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: List.generate(6, (index) {
                                  return const CalenderCard();
                                }),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(3, (index) {
                              return const CheckAppointmentTimeCard();
                            }),
                          ),
                          Row(
                            children: List.generate(2, (index) {
                              return const Padding(
                                padding: EdgeInsets.only(right: 8.0),
                                child: CheckAppointmentTimeCard(),
                              );
                            }),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: const Color(0xff8C8FA5),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.favorite,
                                      color: mainColor,
                                      size: 30,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                flex: 3,
                                child: Container(
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: mainColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Book Appointment',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
