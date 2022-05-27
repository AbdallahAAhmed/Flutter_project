import '../componenets/show_toast.dart';
import '../modules/register_cubit/register_cubit.dart';
import '../modules/register_cubit/register_states.dart';
import 'login.dart';
import '../componenets/elevate_button.dart';
import '../componenets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  static const String routeName = '/sign_up_page';
  SignUpScreen({Key key}) : super(key: key);

  var formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
          listener: (context, state) {
        if (state is RegisterSuccessState) {
          if (state.model.success == true) {
            showToast(
              text: state.model.message,
              state: ToastStates.SUCCESS,
            );
            Navigator.of(context).pushNamed(LoginScreen.routeName);
          } else {
            showToast(
              text: state.model.message,
              state: ToastStates.ERROR,
            );
          }
        } else if (state is RegisterErrorState) {
          showToast(
            text: state.error,
            state: ToastStates.ERROR,
          );
        }
      }, builder: (context, state) {
        RegisterCubit cubit = RegisterCubit.get(context);
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
                  child: Form(
                    key: formKey,
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
                          controller: nameController,
                          title: 'Username',
                          icon: Icons.person,
                          subTitle: 'Masum Ahmed',
                          obscure: false,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'Please Enter Your Name';
                            }
                          },
                        ),
                        const SizedBox(height: 14),
                        TextFieldWidget(
                          controller: emailController,
                          title: 'Email',
                          icon: Icons.email_outlined,
                          subTitle: 'demo.mail@gmail.com',
                          obscure: false,
                          keyboard: TextInputType.emailAddress,
                          validate: (String value) {
                            if (value.isEmpty || !value.contains('@')) {
                              return 'Please Enter Your Email';
                            }
                          },
                        ),
                        const SizedBox(height: 14),
                        TextFieldWidget(
                            controller: passwordController,
                            title: 'Password',
                            icon: Icons.lock_open_outlined,
                            subTitle: '**********',
                            suffix: IconButton(
                              onPressed: () {
                                cubit.changePasswordVisibility();
                              },
                              icon: Icon(cubit.suffix),
                            ),
                            obscure: cubit.isPassword,
                            validate: (String value) {
                              if (value.isEmpty || value.length < 6) {
                                return 'Please Enter Your Password';
                              }
                            }),
                        const SizedBox(height: 14),
                        TextFieldWidget(
                            controller: confirmPasswordController,
                            title: 'Confirm Password',
                            icon: Icons.lock_open_outlined,
                            subTitle: '**********',
                            suffix: IconButton(
                              onPressed: () {
                                cubit.changePasswordConfirmVisibility();
                              },
                              icon: Icon(cubit.suffixConfirm),
                            ),
                            obscure: cubit.isPasswordConfirm,
                            validate: (String value) {
                              if (value.isEmpty ||
                                  value != passwordController.text ||
                                  value.length < 6) {
                                return 'The Passwords is Not Same';
                              }
                            }),
                        const SizedBox(height: 32),
                        state is! RegisterLoadingState
                            ? ElevateButton(
                                title: 'Sign Up',
                                fontSize: 20,
                                heightSize: 50,
                                isBold: true,
                                onPress: () {
                                  if (formKey.currentState.validate()) {
                                    cubit.userRegister(
                                      email: emailController.text,
                                      password: passwordController.text,
                                      name: nameController.text,
                                      passwordConfirmation:
                                          confirmPasswordController.text,
                                    );
                                  }
                                },
                              )
                            : const Center(child: CircularProgressIndicator()),
                      ],
                    ),
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
      }),
    );
  }
}
