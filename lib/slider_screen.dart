import 'dart:async';

import 'package:flutter/material.dart';
import 'package:legends_quotes/Utils/Colors.dart';
import 'package:legends_quotes/Utils/Constants.dart';
import 'package:legends_quotes/tab_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderScreen extends StatefulWidget {
  static const String id = "slider_screen";

  const SliderScreen({Key? key}) : super(key: key);

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

  @override
  void initState() {
    super.initState();
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
                    borderRadius: BorderRadius.circular(10)
                  ),
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
                    color: Colors.blue,
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
                    color: Colors.blue,
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
          const AssetImage('assets/billgates.jpg'),
          '''Challenge yourself towards your future Dream!''',
        ),
        onboardPageView(const AssetImage('assets/quotes_data/Gold/AlbertEinstein/Albert Einstein Profile.jpg'),
            'Make Life By yourSelf!'),
        onboardPageView(const AssetImage('assets/quotes_data/Gold/BruceLee/BruceLeeProfile.jpg'),
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
              borderRadius: 
              BorderRadius.circular(10),
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
      effect: WormEffect(activeDotColor: Colors.blue),
    );
  }
}
