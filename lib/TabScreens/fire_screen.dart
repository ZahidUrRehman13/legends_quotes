
import 'package:flutter/material.dart';
import 'package:pinch_zoom_image_last/pinch_zoom_image_last.dart';
import 'package:legends_quotes/Utils/Constants.dart';

class FireScreen extends StatefulWidget {
  const FireScreen({Key? key}) : super(key: key);

  @override
  State<FireScreen> createState() => _FireScreenState();
}

class _FireScreenState extends State<FireScreen> {
  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: _height*0.05,),
            Text('Quote of the day',style: TextStyle(
              fontSize: 30,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontFamily: Constants.fontfamily
            ),),
            SizedBox(height: _height*0.05,),
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
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(150),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                child: Container(
                  height: _height*0.7,
                  width: _width,
                  margin: EdgeInsets.only(left: _width*0.05,right: _width*0.05),
                  child: Image.asset('assets/fire_image.jpg',fit: BoxFit.cover,),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
