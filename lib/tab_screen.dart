
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:legends_quotes/TabScreens/categories_screen.dart';
import 'package:legends_quotes/TabScreens/fire_screen.dart';
import 'package:legends_quotes/TabScreens/legends_screen.dart';
import 'package:legends_quotes/TabScreens/homes_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {

  int pageIndex = 0;

  final Screen = [
    const LegendsScreen(),
    const HomeScreen(),
    const FireScreen(),
    const CategoriesScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Screen[pageIndex],

      bottomNavigationBar: buildMyNavBar(context),


    );
  }
  Container buildMyNavBar(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(

        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0)
        )
      ),

      height: height*0.08,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 0;
              });
            },

            icon: pageIndex == 0
                ?  Image.asset('assets/legend_icon.png',
              color: Color(0xFFcf1020),)
                : Image.asset('assets/legend_icon.png',
      color: Colors.black54,fit: BoxFit.cover,)
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 1;
              });
            },
            icon: pageIndex == 1
                ? const Icon(
                  Icons.home,
                  color: Color(0xFFcf1020),
                  size: 25,
                )
                : const Icon(
              Icons.home_outlined,
              color: Colors.black54,
              size: 25,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 2;
              });
            },
            icon: pageIndex == 2
                ? const Icon(
                  Icons.local_fire_department_rounded,
                  color: Color(0xFFcf1020),
                  size: 25,
                )
                : const Icon(
              Icons.local_fire_department,
              color: Colors.black54,
              size: 25,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 3;
              });
            },
            icon: pageIndex == 3
                ? const Icon(
                  Icons.category,
                 color: Color(0xFFcf1020),
                  size: 25,
                )
                : const Icon(
                  Icons.category_outlined,
                  color: Colors.black54,
                  size: 25,

                ),
          )
        ],
      ),
    );
  }
}
