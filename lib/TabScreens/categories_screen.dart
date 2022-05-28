
import 'package:flutter/material.dart';
import 'package:pinch_zoom_image_last/pinch_zoom_image_last.dart';
import 'package:legends_quotes/Utils/Constants.dart';
import 'package:switcher_button/switcher_button.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
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
            Text('The Legends Quotes',style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontFamily: Constants.fontfamily
            ),),
            SizedBox(height: _height*0.05,),
            Padding(

              padding:  EdgeInsets.only(left: _width*0.08,right: _width*0.08,bottom: _height*0.17),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Notifications',style: TextStyle(
                      fontSize: 20,
                      fontFamily: Constants.fontfamily
                  ),),
                  SwitcherButton(
                    value: false,
                    onColor: Colors.blue,
                    offColor: Colors.black26,
                    onChange: (value) {
                      print(value);
                    },
                  ),
                ],
              ),
            ),
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
                  bottomRight:  Radius.circular(100),
                ),
                child: Container(
                  height: _height*0.5,
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
