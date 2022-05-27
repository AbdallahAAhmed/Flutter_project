import '../constraints.dart';
import '../modules/app_cubit/app_cubit.dart';
import '../modules/app_cubit/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TabsHome extends StatelessWidget {
  static const String routeName = '/init_home';
  const TabsHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
        body: cubit.screens[cubit.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: cubit.currentIndex,
          onTap: (index) 
          {
            cubit.changeScreenIndex(index);
          },
          selectedItemColor: mainColor,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              label: 'home',
              icon: FaIcon(FontAwesomeIcons.home),
            ),
            BottomNavigationBarItem(
              label: 'doctors',
              icon: FaIcon(FontAwesomeIcons.stethoscope),
            ),
            BottomNavigationBarItem(
              label: 'search',
              icon: FaIcon(FontAwesomeIcons.search),
            ),
            BottomNavigationBarItem(
              label: 'category',
              icon: FaIcon(FontAwesomeIcons.clipboardList),
            ),
            BottomNavigationBarItem(
              label: 'profile',
              icon: FaIcon(FontAwesomeIcons.user),
            ),
          ],
        ),
      );
      },
    );
  }
}
