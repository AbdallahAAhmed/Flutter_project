import '../constraints.dart';
import '../screens/search.dart';
import 'package:flutter/material.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed(SearchScreen.routeName),
                  child: Container(
                    height: 60,
                    padding: const EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.search, color: Colors.grey),
                            SizedBox(width: 10),
                            Text('search',
                                style: TextStyle(color: Colors.grey, fontSize: 17)),
                          ],
                        ),
                        Container(
                          height: 60,
                          width: 60,
                          margin: const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child:
                              const Icon(Icons.tune, color: Colors.white, size: 30),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
