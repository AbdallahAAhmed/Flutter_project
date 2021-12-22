import 'package:doctorappointment/constraints.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ElevateButton extends StatelessWidget {
  final String title;
  final double fontSize;
  final double heightSize;
  final double widthSize;
  Function() onPress;
  bool isBold;
  ElevateButton(
      {Key key,
      this.title,
      this.fontSize,
      this.heightSize,
      this.widthSize,
        this.onPress,
      this.isBold = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: heightSize,
        width: widthSize,
        decoration: BoxDecoration(
          color: mainColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: isBold ? FontWeight.bold : null,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
