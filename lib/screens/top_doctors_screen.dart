import '../constraints.dart';
import '../modules/app_cubit/app_cubit.dart';
import '../modules/app_cubit/app_states.dart';
import 'doctor_details.dart';
import '../componenets/doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopDoctorsScreen extends StatelessWidget {
  static const String routeName = '/top_doctors';
  const TopDoctorsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return cubit.doctorsList != null
            ? Scaffold(
                backgroundColor: backGroundColor,
                appBar: AppBar(
                  title: const Text(
                    'Top Doctors',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  centerTitle: true,
                  backgroundColor: mainColor,
                  elevation: 0.0,
                  actions: const [
                    IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.notifications,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                body: Container(
                  padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: cubit.doctorsList.data.results.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      var currentDoctor = cubit.doctorsList.data.results[index];
                      return DoctorCard(
                        name: currentDoctor.name,
                        image: currentDoctor.image,
                        price: currentDoctor.price,
                        rate: currentDoctor.rate,
                        category: currentDoctor.category.name,
                        id: currentDoctor.id,
                        callbackFun: () => Navigator.of(context).pushNamed(
                            DoctorDetailsScreen.routeName,
                            arguments: currentDoctor.id),
                      );
                    },
                  ),
                ),
                // bottomNavigationBar: const BottomBar(),
              )
            : const Center(child: CircularProgressIndicator());
      },
    );
  }
}
