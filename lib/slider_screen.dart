import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:legends_quotes/Utils/Colors.dart';
import 'package:legends_quotes/Utils/Constants.dart';
import 'package:legends_quotes/main.dart';
import 'package:legends_quotes/tab_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:workmanager/workmanager.dart';

class SliderScreen extends StatefulWidget {
  @override
  _SliderScreenState createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  final controller = PageController();
  int _currentPage = 0;
  Timer? _timer;
  PageController _pageController = PageController(
    initialPage: 0,
  );

  int _counterValue = 0;
  int imageofTheDay=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _retrieveSavedImageIndex();
    // Workmanager.registerPeriodicTask(
    //   TAG,
    //   "simplePeriodicTask",
    //   initialDelay: Duration(seconds: 3),
    // );
    // loalData();
    _timer = Timer.periodic(Duration(seconds: 2), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  // Future<void> _retrieveSavedImageIndex() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   imageofTheDay = prefs.getInt('BackGroundCounterValue') ?? 0;
  //   log("saved imageIndex fire screen : $imageofTheDay");
  //
  // }
  //
  // void loalData() async {
  //   _counterValue = await BackGroundWork.instance._getBackGroundCounterValue();
  //   setState(() {});
  // }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          textMain(height),
          Expanded(child: buildPages()),
          buildIndicator(),
          SizedBox(
            height: height * 0.05,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MaterialButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TabScreen()));
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(
                        fontFamily: Constants.fontfamily,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.black12,
                  elevation: 0.0,
                ),
                SizedBox(
                  width: width * 0.05,
                )
              ],
            ),
          ),
          SizedBox(
            height: height * 0.1,
          ),
        ],
      ),
    );
  }

  Widget textMain(double height) {
    return Container(
      margin: EdgeInsets.only(top: height * 0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Find",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w800,
                    fontFamily: Constants.fontfamily),
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                "Dream",
                style: TextStyle(
                    color: Color(0xFFe60000),
                    fontSize: 30.0,
                    fontWeight: FontWeight.w800,
                    fontFamily: Constants.fontfamily),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                ' of Your',
                style: TextStyle(
                    color: Color(0xFFe60000),
                    fontSize: 30.0,
                    fontWeight: FontWeight.w800,
                    fontFamily: Constants.fontfamily),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                'Life!',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w800,
                    fontFamily: Constants.fontfamily),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildPages() {
    return PageView(
      controller: _pageController,
      //controller: controller,
      children: [
        onboardPageView(
          const AssetImage('assets/quotes_data/Fresh/BillGates/BillGatesProfile_main.jpg'),
          '''Challenge yourself towards your future Dream!''',
        ),
        onboardPageView(
            const AssetImage(
                'assets/quotes_data/Gold/AlbertEinstein/Albert Einstein Profile.jpg'),
            'Make Life By yourSelf!'),
        onboardPageView(
            const AssetImage(
                'assets/quotes_data/Gold/BruceLee/BruceLeeProfile.jpg'),
            'Your attitude is more important than your capabilities!'),
      ],
    );
  }

  Widget onboardPageView(ImageProvider imageProvider, String text) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(
                fit: BoxFit.cover,
                image: imageProvider,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            text,
            style: const TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget buildIndicator() {
    return SmoothPageIndicator(
      controller: _pageController,
      //controller: controller,
      count: 3,
      effect: WormEffect(activeDotColor: Color(0xFFe60000)),
    );
  }
}

// void callbackDispatcher() {
//   Workmanager.executeTask((task, inputData) async {
//     print(TAG + "callbackDispatcher");
//     int value = await BackGroundWork.instance._getBackGroundCounterValue();
//     BackGroundWork.instance._loadCounterValue(value + 1);
//
//     return Future.value(true);
//   });
// }
//
// class BackGroundWork {
//   BackGroundWork._privateConstructor();
//
//   static final BackGroundWork _instance = BackGroundWork._privateConstructor();
//
//   static BackGroundWork get instance => _instance;
//
//
//
//   _loadCounterValue(int value) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   await prefs.setInt('BackGroundCounterValue', value);
//   }
//
//   Future<int> _getBackGroundCounterValue() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     //Return bool
//     int counterValue = prefs.getInt('BackGroundCounterValue') ?? 0;
//     return counterValue;
//   }
// }
