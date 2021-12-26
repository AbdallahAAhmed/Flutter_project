import 'package:doctorappointment/constraints.dart';
import 'package:doctorappointment/componenets/category_card.dart';
import 'package:doctorappointment/modules/app_cubit/app_cubit.dart';
import 'package:doctorappointment/modules/app_cubit/app_states.dart';
import 'package:doctorappointment/screens/doctors_by_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesScreen extends StatelessWidget {
  static const String routeName = '/categories_page';
  const CategoriesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return cubit.userCategories != null
            ? Scaffold(
                backgroundColor: backGroundColor,
                appBar: AppBar(
                  title: const Text(
                    'Categories',
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
                  padding: const EdgeInsets.all(20),
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: cubit.userCategories.data.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      var currentCategory = cubit.userCategories.data[index];
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(DoctorsByCategory.routeName, arguments: currentCategory.id);
                        },
                        child: CategoryCard(
                          name: currentCategory.name,
                          image: currentCategory.image,
                        ),
                      );
                    },
                  ),
                ),
              )
            : const Center(child: CircularProgressIndicator());
      },
    );
  }
}
