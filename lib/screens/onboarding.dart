import '../constraints.dart';
import '../models/on_boarding_model.dart';
import '../network/local/cache_helper.dart';
import 'login.dart';
import '../componenets/build_onboarding_item.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routeName = '/onboarding_page';
  const OnboardingScreen({Key key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<BoardingModel> boarding = [
    BoardingModel(
      title: 'Chat With doctors',
      body: 'Book an appointment with doctor.Chat \n with doctor via appoinment letter & \n get consultant.',
      image: 'assets/images/illustration.png',
    ),
    BoardingModel(
      title: 'Book/ Schedule your Appointments',
      body: 'Want to book an appointment no need to \n go anywhere.book and manage your \n appointment while searching of home.',
      image: 'assets/images/illustration1.jpg',
    ),
    BoardingModel(
      title: 'Manage Your health',
      body: 'Manage your headlth online and get \n assistance an have to improve your health \n online with no human interaction.',
      image: 'assets/images/illustration2.jpg',
    ),
  ];
  var boardController = PageController();
  bool isLast = false;

  void submit() 
  {
    CacheHelper.saveData(
      key: 'onBoarding', 
      value: true,
    ).then((value) 
    { 
      if(value)
      {
        Navigator.of(context).popAndPushNamed(LoginScreen.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 120.0),
        child: Center(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: PageView.builder(
                  controller: boardController,
                  itemCount: boarding.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => buildOnBoardingItem(boarding[index], boardController, boarding),
                  onPageChanged: (int index) {
                    if(index == boarding.length - 1) {
                      setState(() {
                        isLast = true;
                      });
                    }else {
                    setState(() {
                      isLast = false;
                    });
                  }
                  }
                ), 
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 100.0),
                child: SmoothPageIndicator(
                  controller: boardController,
                  count: boarding.length,
                  effect: const WormEffect(
                    dotHeight: 10,
                    dotWidth: 10,
                    dotColor: Colors.grey,
                    activeDotColor: mainColor,
                    spacing: 5.0,
                  ),
                ),
              ),
              Container(
                width: 181,
                height: 40,
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: TextButton(
                    onPressed: submit,
                    child: const Text(
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
