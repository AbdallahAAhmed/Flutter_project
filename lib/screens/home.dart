import 'package:doctorappointment/constraints.dart';
import 'package:doctorappointment/componenets/home_list.dart';
import 'package:doctorappointment/componenets/search_container.dart';
import 'package:doctorappointment/modules/app_cubit/app_cubit.dart';
import 'package:doctorappointment/modules/app_cubit/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home_screen';
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return cubit.userCategories != null && cubit.topDoctorsModel != null && cubit.doctorsList != null
       
            ? Scaffold(
                backgroundColor: mainColor,
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: mainColor,
                  centerTitle: true,
                  title: Column(
                    children: const [
                      Text(
                        'Current Location',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        'Dhaka',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.location_on, size: 30),
                      ),
                    ),
                  ],
                ),
                drawer: const Drawer(),
                body: Container(
                  padding: const EdgeInsets.only(top: 23),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 31,
                          left: 31,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Find your desired',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 7),
                            Text(
                              'Doctor Right Now!',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),
                      const Padding(
                        padding: EdgeInsets.only(
                          right: 31,
                          left: 31,
                        ),
                        child: SearchContainer(),
                      ),
                      const SizedBox(height: 25),
                      Expanded(
                          child: HomeList(
                        categoriesLen: cubit.userCategories.data.length,
                        categories: cubit.userCategories.data,
                        topDoctorLen: cubit.topDoctorsModel.data.results.length,
                        topDoctorData: cubit.topDoctorsModel.data.results,
                      )),
                    ],
                  ),
                ),
                // bottomNavigationBar: const BottomBar(),
              )
            : const Center(child: CircularProgressIndicator());
      },
    );
  }
}
