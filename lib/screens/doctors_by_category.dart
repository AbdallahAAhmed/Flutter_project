// ignore_for_file: avoid_print
import 'package:doctorappointment/componenets/doctor_card.dart';
import 'package:doctorappointment/constraints.dart';
import 'package:doctorappointment/models/list_doctors_by_top_rate.dart';
import 'package:doctorappointment/modules/doctors_by_category_id.dart/cubit.dart';
import 'package:doctorappointment/modules/doctors_by_category_id.dart/states.dart';
import 'package:doctorappointment/screens/doctor_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorsByCategory extends StatelessWidget {
  static const String routeName = '/doctor_by_categoryId';
  const DoctorsByCategory({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryId = ModalRoute.of(context).settings.arguments as String;
    return BlocProvider(
      create: (BuildContext context) =>
          DoctorsByCategoryIdCubit()..getDoctorsByCateogryID(categoryId),
      child: BlocConsumer<DoctorsByCategoryIdCubit, DoctorsByCategoryIDStates>(
        listener: (context, state) {},
        builder: (context, state) {
          DoctorsByCategoryIdCubit cubit = DoctorsByCategoryIdCubit.get(context);
          return Scaffold(
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
            ),
            body: state is! DoctorsByCategoryIdLoadingStates
                ? cubit.doctorsByCategoryId.data.results.isNotEmpty
                  ? buildDoctorsList(doctorsCat: cubit.doctorsByCategoryId.data.results)
                  : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.now_widgets, 
                          size: 50.0,
                          color: Colors.black.withOpacity(0.5),
                        ),
                        const SizedBox(height: 20.0),
                        Text(
                          'There are no doctors yet',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  )
                : const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
  Widget buildDoctorsList(
    {
        @required List<Results> doctorsCat,
    }
  ) => Container(
                    padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
                    child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: doctorsCat.length, 
                      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return DoctorCard(
                          name: doctorsCat[index].name,
                          image: doctorsCat[index].image,
                          price: doctorsCat[index].price,
                          rate: doctorsCat[index].rate,
                          category: doctorsCat[index].category.name,
                          id: doctorsCat[index].id,
                          callbackFun: () {
                            Navigator.of(context).pushNamed(
                              DoctorDetailsScreen.routeName,
                            arguments: doctorsCat[index].id);
                          },
                          );
                      },
                    ),
                  );
}
