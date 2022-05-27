import '../componenets/top_doctor_card.dart';
import '../modules/search_cubit/cubit.dart';
import '../modules/search_cubit/states.dart';
import 'doctor_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../constraints.dart';

class SearchScreen extends StatelessWidget {
  static const String routeName = '/search_page';

  const SearchScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (BuildContext context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchStates>(
        listener: (context, state) {},
        builder: (context, state) {
          SearchCubit cubit = SearchCubit.get(context);
          return Scaffold(
            backgroundColor: backGroundColor,
            appBar: AppBar(
              title: const Text(
                'Search Doctors',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              centerTitle: true,
              backgroundColor: mainColor,
              elevation: 0.0,
              actions: const [
                IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.notifications,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            body: Container(
              padding: const EdgeInsets.all(31),
              child: ListView(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Form(
                      key: formKey,
                      child: TextFormField(
                        validator: (String value){
                          if(value.isEmpty)
                          {
                            return 'Enter Text to Search';
                          }
                          return null;
                        },
                        autofocus: true,
                        controller: searchController,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          prefixIcon: const Icon(Icons.search, color: mainColor),
                          prefixText: 'Dr. ',
                          prefixStyle: const TextStyle(
                            color: textColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                          suffixIcon: IconButton(
                              onPressed: (){
                                searchController.clear();
                              }, 
                              icon: const Icon(Icons.close)),
                        ),
                        onChanged: (String text)
                        {
                          if(formKey.currentState.validate())
                          {
                            cubit.getSearchData(text??'');
                          }
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  if(state is SearchLoadingState)
                  const LinearProgressIndicator(),
                  const SizedBox(height: 10.0),
                  if(state is SearchSuccessState)
                  Column(
                    children: List.generate(cubit.model.data.results.length, (index) {
                      var currentData = cubit.model.data.results[index];
                        return Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: TopDoctorCard(
                          name: currentData.name,
                          category: currentData.category.name,
                          image: currentData.image,
                          price: currentData.price,
                          rate: currentData.rate,
                          callbackFun: () => Navigator.of(context).pushNamed(
                            DoctorDetailsScreen.routeName, arguments: currentData.id),
                        ),
                      );
                    }),
                  ),
                  if(state is SearchErrorState)
                  Center(child: Text('Sorry, can\'t found doctor ${searchController.text}'),),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
