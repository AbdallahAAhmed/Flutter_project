import 'package:flutter/material.dart';

import '../constraints.dart';

class SearchScreen extends StatelessWidget {
  static const String routeName = '/search_page';

  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
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
              child: TextField(
                autofocus: true,
                controller: searchController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  prefixIcon: Icon(Icons.search, color: mainColor),
                  prefixText: 'Dr. ',
                  prefixStyle: TextStyle(
                    color: textColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                  suffixIcon:
                      IconButton(onPressed: null, icon: Icon(Icons.close)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Suggestions',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            Column(
              children: List.generate(6, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.subdirectory_arrow_right,
                              color: textColor),
                          Text(
                            'Dr. Jenny Roy',
                            style: TextStyle(
                              fontSize: 15,
                              color: textColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Divider(
                        color: textColor,
                        height: 5,
                      ),
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: const BottomBar(),
    );
  }
}
