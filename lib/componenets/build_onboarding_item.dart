import 'package:doctorappointment/models/on_boarding_model.dart';
import 'package:flutter/material.dart';

Widget buildOnBoardingItem(BoardingModel model, dynamic controller, List list) => Column(
        children: [
          Image(
            image: AssetImage(model.image),
            height: 250,
            width: 250,
            fit: BoxFit.cover,
          ),
          Container(
            padding: const EdgeInsets.only(left: 5, right: 5, top: 50),
            child: Column(
              children: [
                Text(
                  model.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  model.body,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey.withOpacity(1.0),
                  ),
                  textAlign: TextAlign.center,
                ),
                
              ],
            ),
          ),
        ],
      );