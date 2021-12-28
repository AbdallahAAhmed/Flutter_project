import 'package:doctorappointment/componenets/show_toast.dart';
import 'package:doctorappointment/constraints.dart';
import 'package:doctorappointment/componenets/calender_card.dart';
import 'package:doctorappointment/componenets/check_appointment_time.dart';
import 'package:doctorappointment/componenets/doctor_details_card.dart';
import 'package:doctorappointment/modules/doctor_details/cubit.dart';
import 'package:doctorappointment/modules/doctor_details/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:intl/intl.dart';

class DoctorDetailsScreen extends StatelessWidget {
  static const String routeName = '/doctor_details_page';
  const DoctorDetailsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DatePickerController _controller = DatePickerController();
    
    final _doctorId = ModalRoute.of(context).settings.arguments as String;
    return BlocProvider(
      create: (BuildContext context) =>
          DoctorsDetailsCubit()..getDoctorsDetails(id: _doctorId),
      child: BlocConsumer<DoctorsDetailsCubit, DoctorsDetailsStates>(
          listener: (context, state) {
        if (state is AppSuccessCreateUserAppointmentsState) {
          showToast(
            text: 'Created Appointments is Successfully',
            state: ToastStates.SUCCESS,
          );
        }
      }, builder: (context, state) {
        DoctorsDetailsCubit cubit = DoctorsDetailsCubit.get(context);
        return Scaffold(
          backgroundColor: backGroundColor,
          appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              iconTheme: const IconThemeData(color: Colors.black)),
          body: state is! DoctorsDetailsLoadingState
              ? Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                          right: 32, left: 32, top: 10, bottom: 50),
                      child: DoctorDetailsCard(
                        name: cubit.doctorDetails.data.name,
                        category: cubit.doctorDetails.data.category.name,
                        hospitalName: 'London',
                        image: cubit.doctorDetails.data.image,
                        rate: cubit.doctorDetails.data.rate,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 50, horizontal: 30),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const CircleAvatar(
                                        backgroundColor:
                                            Color.fromRGBO(255, 255, 255, 2.5),
                                        radius: 30.0,
                                        child: FaIcon(FontAwesomeIcons.users,
                                            color: Colors.white),
                                      ),
                                      const SizedBox(width: 15),
                                      Column(
                                        children: const [
                                          Text(
                                            '1100 +',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            'Pateints',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const CircleAvatar(
                                        backgroundColor:
                                            Color.fromRGBO(255, 255, 255, 2.5),
                                        radius: 30.0,
                                        child: FaIcon(FontAwesomeIcons.award,
                                            color: Colors.white),
                                      ),
                                      const SizedBox(width: 15),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            '6 Years',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            'Experiance',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.only(
                                    right: 32, left: 32, top: 32, bottom: 20),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50),
                                    topRight: Radius.circular(50),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'About Doctor',
                                          style: TextStyle(
                                            color: textColor,
                                            fontWeight: FontWeight.w900,
                                            fontSize: 15,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          'Dr. ${cubit.doctorDetails.data.name} is the top most cardiologist specialist in Dhaka Medical College hospital at Dhaka.He achived several award for his wonderful contribution in her own field.He is available for private consultation.',
                                          style: const TextStyle(
                                            color: textColor,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Book Time',
                                          style: TextStyle(
                                            color: textColor,
                                            fontWeight: FontWeight.w900,
                                            fontSize: 15,
                                          ),
                                        ),
                                        Container(
                                          height: 85,
                                          child: DatePicker(
                                            DateTime.now(),
                                            width: 60,
                                            height: 80,
                                            controller: _controller,
                                            initialSelectedDate: DateTime.now(),
                                            selectionColor: mainColor,
                                            selectedTextColor: Colors.white,
                                            inactiveDates: [
                                              DateTime.now()
                                                  .add(const Duration(days: 7))
                                            ],
                                            onDateChange: (date) {
                                              cubit.changeDateTime(date);
                                              print(DateFormat.Md().format(cubit.selectedValue));
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    Wrap(
                                      alignment: WrapAlignment.spaceBetween,
                                      direction: Axis.horizontal,
                                      children: List.generate(
                                          cubit.doctorDetails.data.times.length,
                                          (index) {
                                        return InkWell(
                                          onTap: () => cubit.changeTimeButton(),
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5.0, horizontal: 2.0),
                                            child: CheckAppointmentTimeCard(
                                              time: cubit
                                                  .doctorDetails.data.times,
                                              index: index,
                                            ),
                                          ),
                                        );
                                      }),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            height: 45,
                                            decoration: BoxDecoration(
                                              color: const Color(0xff8C8FA5),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: const Center(
                                              child: Icon(
                                                Icons.favorite,
                                                color: mainColor,
                                                size: 30,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        state
                                                is! AppLoadingCreateUserAppointmentsState
                                            ? Expanded(
                                                flex: 3,
                                                child: InkWell(
                                                  onTap: () => cubit
                                                      .createUserAppointments(
                                                    doctorId: cubit
                                                        .doctorDetails.data.id,
                                                    time: '3:00 PM',
                                                    day: '${DateFormat('EEEE').format(cubit.selectedValue)} ${DateFormat.Md().format(cubit.selectedValue)}',
                                                  ),
                                                  child: Container(
                                                    height: 45,
                                                    decoration: BoxDecoration(
                                                      color: mainColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: const Center(
                                                      child: Text(
                                                        'Book Appointmet',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w900,
                                                          fontSize: 15,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : const Center(
                                                child:
                                                    CircularProgressIndicator()),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : const Center(child: CircularProgressIndicator()),
        );
      }),
    );
  }
}
