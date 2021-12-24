import 'package:bloc/bloc.dart';
import 'package:doctorappointment/constraints.dart';
import 'package:doctorappointment/models/list_doctors_by_top_rate.dart';
import 'package:doctorappointment/modules/doctors_by_category_id.dart/states.dart';
import 'package:doctorappointment/network/remote/dio_helper.dart';
import 'package:doctorappointment/network/remote/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorsByCategoryIdCubit extends Cubit<DoctorsByCategoryIDStates>
{
  DoctorsByCategoryIdCubit() : super(DoctorsByCategoryIdInitialStates());

  static DoctorsByCategoryIdCubit get(context) => BlocProvider.of(context);

  TopDoctors doctorsByCategoryId;
  // String id;


  void getDoctorsByCateogryID(String id)
  {
    emit(DoctorsByCategoryIdLoadingStates());

    DioHelper.getData(
      url: getDoctorsByCategoryIdApi(id),
      token: token,
      )
    .then((value) 
    {
      doctorsByCategoryId = TopDoctors.fromJson(value.data);
      print(doctorsByCategoryId.data.results[5].name);
      // print('Data is : ${value.data['data']['results']}');
      emit(DoctorsByCategoryIdSuccessStates());
    })
    .catchError((error) 
    {
      print(error.toString());
      emit(DoctorsByCategoryIdErrorStates());
    });
  }


}