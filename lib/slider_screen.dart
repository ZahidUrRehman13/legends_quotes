import 'dart:async';

import 'package:flutter/material.dart';
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
            height: 20.0,
          ),
          MaterialButton(onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => TabScreen()));
          },

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
                    fontWeight: FontWeight.w800),
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                "Dream",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w800),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Job',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w800),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                'Program',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildActionButtons() {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          color: Colors.blue,
          minWidth: width * 0.8,
          height: height * 0.06,
          child: const Text(
            'Let\'s Go',
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
          onPressed: () {
            Navigator.pushNamed(context, 'login_screen');
          },
        ),
      ],
    );
  }

  Widget buildPages() {
    return PageView(
      controller: _pageController,
      //controller: controller,
      children: [
        onboardPageView(
          const AssetImage('images/slider_images/recommend.png'),
          '''Challenge yourself towards your future dream job and get bunch of benefits!''',
        ),
        onboardPageView(const AssetImage('images/slider_images/sheet.png'),
            'Alert of new Dream jobs Here!'),
        onboardPageView(const AssetImage('images/slider_images/list.png'),
            'Keep track of what you need to get'),
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
            child: Image(
              fit: BoxFit.fitWidth,
              image: imageProvider,
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
      effect: WormEffect(activeDotColor: Color(0xFF003A90)),
    );
  }
}
