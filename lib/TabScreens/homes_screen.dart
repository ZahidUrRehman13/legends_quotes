import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:legends_quotes/Utils/Constants.dart';
import 'package:pinch_zoom_image_last/pinch_zoom_image_last.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool? _imageLoading;

  var listToShow;

  final List imagesUrlList = [
    'assets/quotes_data/Fresh/BillGates/BillGateQuote1.png',
    'assets/quotes_data/Fresh/BillGates/BillGateQuote2.png',
    'assets/quotes_data/Fresh/BillGates/BillGateQuote3.png',
    'assets/quotes_data/Fresh/BillGates/BillGateQuote4.png',
    'assets/quotes_data/Fresh/elonmusk/Elon Musk Quote1.jpg',
    'assets/quotes_data/Fresh/elonmusk/ElonMuskQuote2.jpg',
    'assets/quotes_data/Fresh/elonmusk/ElonMuskQuote3.jpg',
    'assets/quotes_data/Fresh/elonmusk/ElonMuskQuote5.jpg',
    'assets/quotes_data/Fresh/elonmusk/ElonMuskQuote6.jpg',
    'assets/quotes_data/Fresh/elonmusk/ElonMuskQuote7.png',
    'assets/quotes_data/Fresh/elonmusk/ElonMuskQuote8.jpg',
    'assets/quotes_data/Fresh/elonmusk/ElonMuskQuote9.jpg',
    'assets/quotes_data/Fresh/elonmusk/ElonMuskQuote10.png',
    'assets/quotes_data/Fresh/elonmusk/ElonMuskQuote11.jpg',
    'assets/quotes_data/Fresh/JackMa/jackmaquote1.jpg',
    'assets/quotes_data/Fresh/JackMa/jackmaquote2.jpg',
    'assets/quotes_data/Fresh/JackMa/jackmaquote3.png',
    'assets/quotes_data/Fresh/JackMa/jackmaquote4.jpg',
    'assets/quotes_data/Fresh/JackMa/jackmaquote5.jpg',
    'assets/quotes_data/Fresh/JackMa/jackmaquote6.jpg',
    'assets/quotes_data/Fresh/JackMa/jackmaquote7.jpg',
    'assets/quotes_data/Fresh/JackMa/jackmaquote8.jpg',
    'assets/quotes_data/Fresh/JeffBezos/jeffbezosquote1.png',
    'assets/quotes_data/Fresh/JeffBezos/jeffbezosquote2.jpg',
    'assets/quotes_data/Fresh/JeffBezos/jeffbezosquote3.png',
    'assets/quotes_data/Fresh/JeffBezos/jeffbezosquote4.png',
    'assets/quotes_data/Fresh/JeffBezos/jeffbezosquote5.png',
    'assets/quotes_data/Fresh/JeffBezos/jeffbezosquote6.png',
    'assets/quotes_data/Fresh/JeffBezos/jeffbezosquote7.jpg',
    'assets/quotes_data/Fresh/JeffBezos/jeffbezosquote8.jpg',
    'assets/quotes_data/Fresh/JeffBezos/jeffbezosquote9.jpg',
    'assets/quotes_data/Fresh/JeffBezos/jeffbezosquote10.jpg',
    'assets/quotes_data/Fresh/JeffBezos/jeffbezosquote11.jpg',
    'assets/quotes_data/Fresh/WarrenBuffett/WarrenBuffettquotes1.jpg',
    'assets/quotes_data/Fresh/WarrenBuffett/WarrenBuffettquotes2.png',
    'assets/quotes_data/Fresh/WarrenBuffett/WarrenBuffettquotes3.png',
    'assets/quotes_data/Fresh/WarrenBuffett/WarrenBuffettquotes4.png',
    'assets/quotes_data/Fresh/WarrenBuffett/WarrenBuffettquotes5.png',
    'assets/quotes_data/Fresh/WarrenBuffett/WarrenBuffettquotes6.jpg',
    'assets/quotes_data/Fresh/WarrenBuffett/WarrenBuffettquotes7.png',
    'assets/quotes_data/Fresh/WarrenBuffett/WarrenBuffettquotes8.jpg',
    'assets/quotes_data/Fresh/WarrenBuffett/WarrenBuffettquotes9.png',
    'assets/quotes_data/Fresh/WarrenBuffett/WarrenBuffettquotes10.png',//Gold
    'assets/quotes_data/Gold/AlbertEinstein/AlbertEinsteinQuote1.jpg',
    'assets/quotes_data/Gold/AlbertEinstein/AlbertEinsteinQuote2.jpg',
    'assets/quotes_data/Gold/AlbertEinstein/AlbertEinsteinQuote3.jpg',
    'assets/quotes_data/Gold/AlbertEinstein/AlbertEinsteinQuote4.jpg',
    'assets/quotes_data/Gold/AlbertEinstein/AlbertEinsteinQuote5.png',
    'assets/quotes_data/Gold/AlbertEinstein/AlbertEinsteinQuote6.jpg',
    'assets/quotes_data/Gold/AlbertEinstein/AlbertEinsteinQuote7.jpg',
    'assets/quotes_data/Gold/AlbertEinstein/AlbertEinsteinQuote8.png',
    'assets/quotes_data/Gold/AlbertEinstein/AlbertEinsteinQuote9.jpg',
    'assets/quotes_data/Gold/AlbertEinstein/AlbertEinsteinQuote10.jpg',
    'assets/quotes_data/Gold/AlbertEinstein/AlbertEinsteinQuote11.png',
    'assets/quotes_data/Gold/AlbertEinstein/AlbertEinsteinQuote12.jpg',
    'assets/quotes_data/Gold/BruceLee/BruceLeeQuotes1.jpg',
    'assets/quotes_data/Gold/BruceLee/BruceLeeQuotes2.jpg',
    'assets/quotes_data/Gold/BruceLee/BruceLeeQuotes3.jpg',
    'assets/quotes_data/Gold/BruceLee/BruceLeeQuotes4.jpg',
    'assets/quotes_data/Gold/BruceLee/BruceLeeQuotes5.jpg',
    'assets/quotes_data/Gold/BruceLee/BruceLeeQuotes6.jpg',
    'assets/quotes_data/Gold/BruceLee/BruceLeeQuotes7.jpg',
    'assets/quotes_data/Gold/BruceLee/BruceLeeQuotes8.jpg',
    'assets/quotes_data/Gold/BruceLee/BruceLeeQuotes9.png',
    'assets/quotes_data/Gold/BruceLee/BruceLeeQuotes10.jpg',
    'assets/quotes_data/Gold/BruceLee/BruceLeeQuotes11.jpg',
    'assets/quotes_data/Gold/BruceLee/BruceLeeQuotes12.jpg',
    'assets/quotes_data/Gold/OscarWilde/oscarwildequote1.jpg',
    'assets/quotes_data/Gold/OscarWilde/oscarwildequote2.jpg',
    'assets/quotes_data/Gold/OscarWilde/oscarwildequote3.jpg'
    'assets/quotes_data/Gold/OscarWilde/oscarwildequote4.png',
    'assets/quotes_data/Gold/OscarWilde/oscarwildequote5.jpg',
    'assets/quotes_data/Gold/OscarWilde/oscarwildequote6.jpg',
    'assets/quotes_data/Gold/OscarWilde/oscarwildequote7.jpg',
    'assets/quotes_data/Gold/OscarWilde/oscarwildequote8.jpg',
    'assets/quotes_data/Gold/OscarWilde/oscarwildequote9.jpg',
    'assets/quotes_data/Gold/OscarWilde/oscarwildequote10.png',
    'assets/quotes_data/Gold/OscarWilde/oscarwildequote11.png',
    'assets/quotes_data/Gold/OscarWilde/oscarwildequote12.png',
    'assets/quotes_data/Gold/OscarWilde/oscarwildequote13.jpg',
    'assets/quotes_data/Gold/OscarWilde/oscarwildequote14.jpg',
    'assets/quotes_data/Gold/OscarWilde/oscarwildequote15.png',
    'assets/quotes_data/Gold/Rumi/RumiQuote1.jpg',
    'assets/quotes_data/Gold/Rumi/RumiQuote2.png',
    'assets/quotes_data/Gold/Rumi/RumiQuote3.jpg',
    'assets/quotes_data/Gold/Rumi/RumiQuote4.jpg',
    'assets/quotes_data/Gold/Rumi/RumiQuote5.jpg',
    'assets/quotes_data/Gold/Rumi/RumiQuote6.jpg',
    'assets/quotes_data/Gold/Rumi/RumiQuote7.png',
    'assets/quotes_data/Gold/Rumi/RumiQuote8.jpg',
    'assets/quotes_data/Gold/Rumi/RumiQuote9.jpg',
    'assets/quotes_data/Gold/Rumi/RumiQuote10.jpg',
    'assets/quotes_data/Gold/Rumi/RumiQuote11.jpg',
    'assets/quotes_data/Gold/Rumi/RumiQuote12.jpg',
    'assets/quotes_data/Gold/Rumi/RumiQuote13.jpg',
    'assets/quotes_data/Gold/Rumi/RumiQuote14.png',
    'assets/quotes_data/Gold/Rumi/RumiQuote15.jpg',
    'assets/quotes_data/Gold/Rumi/RumiQuote16.jpg',
    'assets/quotes_data/Gold/Rumi/RumiQuote17.png',
    'assets/quotes_data/Gold/Rumi/RumiQuote18.jpg',
    'assets/quotes_data/Gold/Rumi/RumiQuote19.jpg',
    'assets/quotes_data/Gold/Rumi/RumiQuote20.jpg',
    'assets/quotes_data/Gold/SteveJobs/stevejobsquote1.jpg',
    'assets/quotes_data/Gold/SteveJobs/stevejobsquote2.jpg',
    'assets/quotes_data/Gold/SteveJobs/stevejobsquote3.jpg',
    'assets/quotes_data/Gold/SteveJobs/stevejobsquote4.jpg',
    'assets/quotes_data/Gold/SteveJobs/stevejobsquote5.jpg',
    'assets/quotes_data/Gold/SteveJobs/stevejobsquote6.jpg',
    'assets/quotes_data/Gold/SteveJobs/stevejobsquote7.jpg',
    'assets/quotes_data/Gold/SteveJobs/stevejobsquote8.jpg',
    'assets/quotes_data/Gold/SteveJobs/stevejobsquote9.jpg',
  ];

  _startLoading() {
    setState(() {
      _imageLoading = true;
    });

    Timer(const Duration(seconds: 1), () {
      setState(() {
        _imageLoading = false;
      });
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listToShow = [];
    final _random = new Random();
    listToShow = new List.generate(imagesUrlList.length,
            (_) => imagesUrlList[_random.nextInt(imagesUrlList.length)])
        .toSet()
        .toList();
    _startLoading();
    print(listToShow.length);
  }

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white10,
      body: SafeArea(
          child: _imageLoading==true ? Center(
            child: CircularProgressIndicator(
              color: Color(0xFFe60000),
            ),
          ) :ListView.separated(
            physics: BouncingScrollPhysics(),
              itemCount: listToShow.length,
              itemBuilder: (BuildContext context, index) {
                return Column(
                  children: [
                    PinchZoomImage(
                      zoomedBackgroundColor:
                      Color.fromRGBO(240, 240, 240, 1.0),
                      hideStatusBarWhileZooming: true,
                      onZoomStart: () {
                        print('Zoom started');
                      },
                      onZoomEnd: () {
                        print('Zoom finished');
                      },
                      image: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            margin: EdgeInsets.only(left: 10.0,right: 10.0),
                          child: Image.asset(
                            '${listToShow[index]}',
                            fit: BoxFit.cover,
                          ),
                        )
                      ),
                    ),
                    // ClipRRect(
                    //   // borderRadius: BorderRadius.circular(10),
                    //   child: Container(
                    //
                    //     child: Image.asset(
                    //       '${listToShow[index]}',
                    //       fit: BoxFit.fill,
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: _height * 0.01,
                    // )
                  ],
                );
                //   Stack(
                //   children: [
                //     Positioned(
                //         top: 00,
                //         child: Container(
                //             height: _height*0.8,
                //             width: _width,
                //             child: Image.asset('${imagesUrlList[index]}',fit: BoxFit.cover,))),
                //
                //     Positioned(
                //         top: _height*0.65,
                //         left: _width*0.35,
                //         child: Text('1% LUCK',style: buildTextStyle(),)
                //     ),
                //     Positioned(
                //         top: _height*0.7,
                //         left: _width*0.35,
                //         child: Text('1% TALENT',style: buildTextStyle(),)
                //     ),
                //     Positioned(
                //         top: _height*0.75,
                //         left: _width*0.26,
                //         child: Text('98% NEVER GIVE UP',style: buildTextStyle(),)
                //     ),
                //     Positioned(
                //         top: _height*0.8,
                //         left: _width*0.25,
                //         child: Text('0% SUCCESS FORMULA',style: buildTextStyle(),)
                //     ),
                //
                //   ],
                // );
              }, separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height:_height*0.05 ,);
          },)),
    );
  }

  TextStyle buildTextStyle() => TextStyle(
      color: Colors.white,
      fontSize: 25,
      fontWeight: FontWeight.bold,
      fontFamily: Constants.fontfamily);
}
