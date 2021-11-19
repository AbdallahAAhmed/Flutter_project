import 'app_bottom_bar_item.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<AppBottomBarItem> barItems = [
  AppBottomBarItem(
    icon: FontAwesomeIcons.home,
    isSelected: true,
  ),
  AppBottomBarItem(
    icon: FontAwesomeIcons.stethoscope,
    isSelected: false,
  ),
  AppBottomBarItem(
    icon: FontAwesomeIcons.search,
    isSelected: false,
  ),
  AppBottomBarItem(
    icon: FontAwesomeIcons.clipboardList,
    isSelected: false,
  ),
  AppBottomBarItem(
    icon: FontAwesomeIcons.user,
    isSelected: false,
  )
];
