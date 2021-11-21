import 'package:doctorappointment/constraints.dart';
import 'package:doctorappointment/screens/doctor_details.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DoctorCard extends StatelessWidget {
  final String? id;
  final String? name;
  final String? category;
  final double? price;
  final double? rate;
  final String? image;
  Function()? callbackFun;
  DoctorCard({
    Key? key,
    this.name,
    this.category,
    this.price,
    this.rate,
    this.image,
    this.id,
    this.callbackFun,
  }) : super(key: key);
  void selectDoctor(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(DoctorDetailsScreen.routeName, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 190,
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey.withOpacity(0.7)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 62,
            height: 62,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: Colors.grey.withOpacity(0.8)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image(
                image: AssetImage(image!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            'Dr. $name',
            style: TextStyle(
              fontSize: name!.length > 16 ? 11 : 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            '$category',
            style: TextStyle(
              fontSize: 12,
              color: Colors.black.withOpacity(0.6),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '\$$price',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 20),
              Row(
                children: [
                  const Icon(Icons.star_rate_sharp,
                      color: Colors.orangeAccent, size: 20),
                  Text(
                    '$rate',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            width: 95,
            height: 23,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(mainColor),
              ),
              onPressed: callbackFun,
              child: const Text(
                'Book Now',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
