import 'package:doctorappointment/constraints.dart';
import 'package:doctorappointment/models/on_boarding_model.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

Widget buildOnBoardingItem(BoardingModel model, dynamic controller, List list) => Column(
        children: [
          Image(
            image: AssetImage(model.image),
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