import 'package:doctorappointment/constraints.dart';
import 'package:doctorappointment/modules/app_cubit/app_cubit.dart';
import 'package:doctorappointment/modules/app_cubit/app_states.dart';
import 'package:doctorappointment/screens/categories.dart';
import 'package:doctorappointment/screens/doctor_details.dart';
import 'package:doctorappointment/screens/doctors_by_category.dart';
import 'package:doctorappointment/screens/top_doctors_screen.dart';
import 'package:doctorappointment/componenets/category_container.dart';
import 'package:doctorappointment/componenets/top_doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeList extends StatelessWidget {
  final int categoriesLen;
  final dynamic categories;
  final int topDoctorLen;
  final dynamic topDoctorData;
  const HomeList(
      {Key key,
      this.categoriesLen,
      this.categories,
      this.topDoctorLen,
      this.topDoctorData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.only(left: 31, right: 31, top: 31),
          decoration: const BoxDecoration(
            color: backGroundColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50), topRight: Radius.circular(50)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context)
                        .pushNamed(CategoriesScreen.routeName),
                    child: const Text(
                      'See all',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: mainColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(categoriesLen, (index) {
                    var currentCategory = categories[index];
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                            DoctorsByCategory.routeName,
                            arguments: currentCategory.id);
                      },
                      child: CategoryContainer(
                          title: currentCategory.name,
                          image: currentCategory.image),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Top Doctors',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context)
                        .pushNamed(TopDoctorsScreen.routeName),
                    child: const Text(
                      'See all',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: mainColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: topDoctorLen,
                  itemBuilder: (context, index) {
                    var currentDoctor = topDoctorData[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: TopDoctorCard(
                        name: currentDoctor.name,
                        image: currentDoctor.image,
                        rate: currentDoctor.rate,
                        price: currentDoctor.price,
                        category: currentDoctor.category.name,
                        id: currentDoctor.id,
                        callbackFun: () => Navigator.of(context).pushNamed(
                            DoctorDetailsScreen.routeName,
                            arguments: currentDoctor.id),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
