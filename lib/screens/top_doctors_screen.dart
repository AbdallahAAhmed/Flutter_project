import 'package:doctorappointment/constraints.dart';
import 'package:doctorappointment/models/dummy_doctors.dart';
import 'package:doctorappointment/widgets/bottom_bar.dart';
import 'package:doctorappointment/widgets/doctor_card.dart';
import 'package:flutter/material.dart';

class TopDoctorsScreen extends StatelessWidget {
  static const String routeName = '/top_doctors';
  const TopDoctorsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        title: const Text(
          'Top Doctors',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: mainColor,
        elevation: 0.0,
        actions: const [
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
        child: GridView.builder(
          itemCount: doctors.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
          ),
          itemBuilder: (BuildContext context, int index) {
            var currentDoctor = doctors[index];
            return DoctorCard(
              name: currentDoctor.name,
              image: currentDoctor.image,
              price: currentDoctor.price,
              rate: currentDoctor.rate,
              category: currentDoctor.department,
            );
          },
        ),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}
