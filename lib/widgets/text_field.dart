import 'package:doctorappointment/constraints.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFieldWidget extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final IconData? icon;
  final TextInputType? keyboard;
  final Widget? suffix;
  bool? obscure;
  TextFieldWidget(
      {Key? key,
      this.title,
      this.icon,
      this.subTitle,
      this.suffix,
      required this.obscure,
      this.keyboard})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title!,
          style: TextStyle(
            fontSize: 15,
            color: Colors.black.withOpacity(0.7),
          ),
        ),
        const SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xff8C8FA5).withOpacity(0.2),
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextField(
            obscureText: obscure! ? true : false,
            keyboardType: keyboard,
            decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide(color: mainColor, width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide(
                    color: const Color(0xff8C8FA5).withOpacity(0.0),
                    width: 2.0),
              ),
              prefixIcon: Icon(
                icon,
                color: const Color(0xff8C8FA5),
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              hintText: subTitle,
              suffixIcon: suffix,
            ),
          ),
        ),
      ],
    );
  }
}
