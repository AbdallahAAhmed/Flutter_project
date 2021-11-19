import 'package:doctorappointment/constraints.dart';
import 'package:doctorappointment/screens/home.dart';
import 'package:doctorappointment/screens/sign_up.dart';
import 'package:doctorappointment/widgets/elevate_button.dart';
import 'package:doctorappointment/widgets/text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login_page';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    bool isChecked = false;
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
                      'Sign In',
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
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 80),
                    child: Column(
                      children: const [
                        Text(
                          'Welcome Back!',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: mainColor,
                          ),
                        ),
                        Text(
                          'Sign in to continue',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            checkColor: Colors.grey,
                            fillColor: MaterialStateProperty.all(
                                const Color(0xff8C8FA5)),
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value!;
                              });
                            },
                          ),
                          const Text(
                            'Remember me',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xff8C8FA5),
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontSize: 12,
                          color: mainColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  ElevateButton(
                    title: 'Sign In',
                    fontSize: 20,
                    heightSize: 50,
                    isBold: true,
                    onPress: () => Navigator.of(context).pushNamed(HomeScreen.routeName),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        'ــــــــــــــــــــــــــــــــــــــــــــ',
                        style: TextStyle(
                          color: Color(0xff8C8FA5),
                        ),
                      ),
                      Text(
                        'or',
                        style: TextStyle(
                          color: Color(0xff8C8FA5),
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'ــــــــــــــــــــــــــــــــــــــــــــ',
                        style: TextStyle(
                          color: Color(0xff8C8FA5),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Image(
                        image: AssetImage('assets/images/facebook.png'),
                        width: 38,
                        height: 38,
                      ),
                      SizedBox(width: 15),
                      Image(
                        image: AssetImage('assets/images/search.png'),
                        width: 38,
                        height: 38,
                      ),
                      SizedBox(width: 15),
                      Image(
                        image: AssetImage('assets/images/twitter.png'),
                        width: 38,
                        height: 38,
                      ),
                    ],
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
                              .pushNamed(SignUpScreen.routeName),
                          child: const Text(
                            'Sign Up',
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
