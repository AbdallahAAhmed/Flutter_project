import 'package:doctorappointment/constraints.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const Image(
                    image: AssetImage('assets/images/illustration.png'),
                    fit: BoxFit.cover,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 5, right: 5, top: 50),
                    child: Column(
                      children: [
                        const Text(
                          'Chat with doctors',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Book an appointment with doctor.Chat \n with doctor via appoinment letter & \n get consultant.',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey.withOpacity(1.0),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 50),
                        SizedBox(
                          width: 47,
                          height: 11,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 11,
                                height: 11,
                                decoration: BoxDecoration(
                                  color: mainColor.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              Container(
                                width: 11,
                                height: 11,
                                decoration: BoxDecoration(
                                  color:
                                      const Color(0xff555FD2).withOpacity(0.6),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              Container(
                                width: 11,
                                height: 11,
                                decoration: BoxDecoration(
                                  color: const Color(0xff555FD2),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                width: 181,
                height: 40,
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: TextButton(
                    onPressed: null,
                    child: Text(
                      'Start',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
