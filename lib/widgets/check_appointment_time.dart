import 'package:doctorappointment/constraints.dart';
import 'package:flutter/material.dart';

class CheckAppointmentTimeCard extends StatelessWidget {
  const CheckAppointmentTimeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 110,
      decoration: BoxDecoration(
        color: backGroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Center(
        child: Text(
          '09:30 am',
          style: TextStyle(
            color: Color(0xff8C8FA5),
          ),
        ),
      ),
    );
  }
}
