
import 'package:flutter/material.dart';
import 'package:legends_quotes/Utils/Constants.dart';

class LegendScreen extends StatefulWidget {
  const LegendScreen({Key? key}) : super(key: key);

  @override
  State<LegendScreen> createState() => _LegendScreenState();
}

class _LegendScreenState extends State<LegendScreen> {
  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white10,
      body: SafeArea(
        child: Stack(
         children: [
           Positioned(
         top: 00,
               child: Container(
                 height: _height,
                   width: _width,
                   child: Image.asset('assets/fire_image.jpg',fit: BoxFit.cover,))),

           Positioned(
             top: _height*0.65,
                left: _width*0.35,
                child: Text('1% LUCK',style: buildTextStyle(),)
            ),
           Positioned(
               top: _height*0.7,
               left: _width*0.35,
               child: Text('1% TALENT',style: buildTextStyle(),)
           ),
           Positioned(
               top: _height*0.75,
               left: _width*0.26,
               child: Text('98% NEVER GIVE UP',style: buildTextStyle(),)
           ),
           Positioned(
               top: _height*0.8,
               left: _width*0.25,
               child: Text('0% SUCCESS FORMULA',style: buildTextStyle(),)
           ),

         ],
        ),
      ),
    );
  }

  TextStyle buildTextStyle() => TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold,fontFamily: Constants.fontfamily);
}
