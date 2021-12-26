import 'package:doctorappointment/constraints.dart';
import 'package:doctorappointment/models/list_doctors_by_top_rate.dart';
import 'package:doctorappointment/modules/search_cubit/states.dart';
import 'package:doctorappointment/network/remote/dio_helper.dart';
import 'package:doctorappointment/network/remote/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchStates>
{
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);

  TopDoctors model;

  void getSearchData(String text)
  {
    emit(SearchLoadingState());
    DioHelper.getData(
      url: searchUrl(text),
      token: token,
    ).then((value) {
      model = TopDoctors.fromJson(value.data);
      print(model.data.results[0].name);
      emit(SearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SearchErrorState());
    });
  }
}