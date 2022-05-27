import '../modules/doctor_details/cubit.dart';
import '../modules/doctor_details/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckAppointmentTimeCard extends StatelessWidget {
  final List<String> time;
  final int index;
  const CheckAppointmentTimeCard({Key key, this.time, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorsDetailsCubit, DoctorsDetailsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          height: 50,
          width: 110,
          decoration: BoxDecoration(
            color: DoctorsDetailsCubit.get(context).color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              time[index],
              style: TextStyle(
                color: DoctorsDetailsCubit.get(context).colorText,
              ),
            ),
          ),
        );
      },
    );
  }
}
