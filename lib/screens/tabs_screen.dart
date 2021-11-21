import 'package:doctorappointment/constraints.dart';
import 'package:doctorappointment/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:doctorappointment/screens/categories.dart';
import 'package:doctorappointment/screens/profile.dart';
import 'package:doctorappointment/screens/search.dart';
import 'package:doctorappointment/screens/top_doctors_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TabsHome extends StatefulWidget {
  static const String routeName = '/init_home';
  const TabsHome({Key? key}) : super(key: key);

  @override
  _TabsHomeState createState() => _TabsHomeState();
}

class _TabsHomeState extends State<TabsHome> {
  int _currentScreenIndex = 0;
  final List _screens = const [
    HomeScreen(),
    TopDoctorsScreen(),
    SearchScreen(),
    CategoriesScreen(),
    ProfileScreen()
  ];

  void _updateScreenIndex(int value) {
    setState(() {
      _currentScreenIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentScreenIndex,
        onTap: _updateScreenIndex,
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
  }
}
