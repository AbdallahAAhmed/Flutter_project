import 'package:doctorappointment/constraints.dart';
import 'package:doctorappointment/models/doctor_model.dart';
import 'package:doctorappointment/models/dummy_doctors.dart';
import 'package:doctorappointment/screens/categories.dart';
import 'package:doctorappointment/screens/doctor_details.dart';
import 'package:doctorappointment/screens/top_doctors_screen.dart';
import 'package:doctorappointment/widgets/category_container.dart';
import 'package:doctorappointment/widgets/top_doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomeList extends StatelessWidget {
  const HomeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Doctor> _topDoctorRate = doctors.where((doctor) {
      return doctor.rate! >= 4.6;
    }).toList();
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 31, right: 31, top: 31),
      decoration: const BoxDecoration(
        color: backGroundColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50), topRight: Radius.circular(50)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Categories',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed(CategoriesScreen.routeName),
                child: const Text(
                  'See all',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: mainColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              CategoryContainer(
                  title: 'Cardiologist', image: 'assets/images/heart.png'),
              CategoryContainer(
                  title: 'Orthopedic', image: 'assets/images/osteoporosis.png'),
              CategoryContainer(
                  title: 'Dentist', image: 'assets/images/tooth.png'),
            ],
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Top Doctors',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed(TopDoctorsScreen.routeName),
                child: const Text(
                  'See all',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: mainColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          Expanded(
            child: ListView.builder(
              itemCount: _topDoctorRate.length,
              itemBuilder: (context, index) {
                var currentDoctor = _topDoctorRate[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: TopDoctorCard(
                    name: currentDoctor.name,
                    image: currentDoctor.image,
                    rate: currentDoctor.rate,
                    price: currentDoctor.price,
                    category: currentDoctor.department,
                    id: currentDoctor.id,
                    callbackFun: () => Navigator.of(context).pushNamed(
                        DoctorDetailsScreen.routeName,
                        arguments: currentDoctor.id),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
