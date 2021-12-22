import 'package:doctorappointment/screens/login.dart';
import 'package:doctorappointment/componenets/elevate_button.dart';
import 'package:doctorappointment/componenets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUpScreen extends StatelessWidget {
  static const String routeName = '/sign_up_page';
  const SignUpScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Stack(
                children: const [
                  Image(
                    image: AssetImage('assets/images/Vector 1.png'),
                  ),
                  Center(
                      child: Padding(
                    padding: EdgeInsets.only(top: 65),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  )),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 42),
              child: Column(
                children: [
                  const Text(
                    'Sign up to continue.',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 40),
                  TextFieldWidget(
                    title: 'Username',
                    icon: Icons.person,
                    subTitle: 'Masum Ahmed',
                    obscure: false,
                  ),
                  const SizedBox(height: 14),
                  TextFieldWidget(
                    title: 'Email',
                    icon: Icons.email_outlined,
                    subTitle: 'demo.mail@gmail.com',
                    obscure: false,
                    keyboard: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 14),
                  TextFieldWidget(
                    title: 'Password',
                    icon: Icons.lock_open_outlined,
                    subTitle: '**********',
                    suffix: const Image(
                      image: AssetImage('assets/images/closed_eye.png'),
                      width: 15,
                      height: 14,
                    ),
                    obscure: true,
                  ),
                  const SizedBox(height: 14),
                  TextFieldWidget(
                    title: 'Confirm Password',
                    icon: Icons.lock_open_outlined,
                    subTitle: '**********',
                    suffix: const Image(
                      image: AssetImage('assets/images/closed_eye.png'),
                      width: 15,
                      height: 14,
                    ),
                    obscure: true,
                  ),
                  const SizedBox(height: 32),
                  ElevateButton(
                    title: 'Sign Up',
                    fontSize: 20,
                    heightSize: 50,
                    isBold: true,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Stack(
                children: [
                  const Image(
                    image: AssetImage('assets/images/Vector 3.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 120, left: 75),
                    child: Row(
                      children: [
                        const Text(
                          'Already have an account?',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context)
                              .pushNamed(LoginScreen.routeName),
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
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
      ),
    );
  }
}
