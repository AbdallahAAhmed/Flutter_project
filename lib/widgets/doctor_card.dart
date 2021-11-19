import 'package:doctorappointment/constraints.dart';
import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  final String? name;
  final String? category;
  final double? price;
  final double? rate;
  final String? image;
  const DoctorCard(
      {Key? key, this.name, this.category, this.price, this.rate, this.image})
      : super(key: key);

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
            style: const TextStyle(
              fontSize: 15,
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
              onPressed: () {},
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
