import 'package:doctorappointment/constraints.dart';
import 'package:doctorappointment/models/app_bottom_bar_item.dart';
import 'package:doctorappointment/models/dummy_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset.zero,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(barItems.length, (index) {
          AppBottomBarItem currentBarItem = barItems[index];
          Widget barItemWidget;

          if (currentBarItem.isSelected) {
            barItemWidget = Container(
              padding:
                  const EdgeInsets.only(left: 15, top: 5, bottom: 5, right: 15),
              child: Row(
                children: [FaIcon(currentBarItem.icon!, color: mainColor)],
              ),
            );
          } else {
            barItemWidget = IconButton(
                onPressed: () {
                  setState(() {
                    for (var item in barItems) {
                      item.isSelected = item == currentBarItem;
                    }
                  });
                },
                icon: FaIcon(currentBarItem.icon!, color: Colors.grey));
          }
          return barItemWidget;
        }),
      ),
    );
  }
}
