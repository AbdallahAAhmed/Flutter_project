import 'package:flutter/material.dart';

class CalenderCard extends StatelessWidget {
  const CalenderCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 5),
      width: 52,
      height: 61,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: const Color(0xff8C8FA5), width: 1),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(9),
              topRight: Radius.circular(9),
            ),
            child: Container(
              width: double.infinity,
              height: 18,
              color: const Color(0xff8C8FA5),
            ),
          ),
          const Text(
            'Sun',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xff8C8FA5),
            ),
          ),
          const Text(
            '09',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xff8C8FA5),
            ),
          ),
        ],
      ),
    );
  }
}
