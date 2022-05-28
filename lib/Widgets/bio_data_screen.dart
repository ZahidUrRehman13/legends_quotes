

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinch_zoom_image_last/pinch_zoom_image_last.dart';
import 'package:legends_quotes/Utils/Constants.dart';

class BioDataScreen extends StatefulWidget {
  const BioDataScreen({Key? key}) : super(key: key);

  @override
  State<BioDataScreen> createState() => _BioDataScreenState();
}

class _BioDataScreenState extends State<BioDataScreen> {
  int age = 60;
  String born = 'June 28, 1950';
  String bioData =
      "Born William Henry III is an American entrepreneur, business mogul, investor, philanthropist, "
      "and widely known as one of the most richest and influential people in the world. "
      "William Henry III was born to attorney, William Henry II and teacher,"
      " Mary Maxwell Gates in Seattle, Washington, USA.";
  String name = "Bill gates";
  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            SizedBox(
              height: _height * 0.03,
            ),
            PinchZoomImage(
              zoomedBackgroundColor: Color.fromRGBO(240, 240, 240, 1.0),
              hideStatusBarWhileZooming: true,
              onZoomStart: () {
                print('Zoom started');
              },
              onZoomEnd: () {
                print('Zoom finished');
              },
              image: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(100),
                ),
                child: Container(
                  height: _height * 0.5,
                  width: _width,
                  margin: EdgeInsets.only(
                      left: _width * 0.05, right: _width * 0.05),
                  child: Image.asset(
                    'assets/billgates.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: _width * 0.1,
                  right: _width * 0.05,
                  top: _height * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bill Gates',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: Constants.fontfamily,
                              fontSize: 30),
                        ),
                        Text(
                          'CEO of MicroSoft',
                          style: TextStyle(
                              fontFamily: Constants.fontfamily, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Text(
                                'Age:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: Constants.fontfamily,
                                    fontSize: 15),
                              ),
                              SizedBox(
                                width: _width * 0.01,
                              ),
                              Text(
                                '$age',
                                style: TextStyle(
                                    fontFamily: Constants.fontfamily,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Text(
                                'Born: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: Constants.fontfamily,
                                    fontSize: 15),
                              ),
                              SizedBox(
                                width: _width * 0.01,
                              ),
                              Text(
                                '$born',
                                style: TextStyle(
                                    fontFamily: Constants.fontfamily,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: _height * 0.08,
            ),
            Padding(
              padding:  EdgeInsets.only(left: _width*0.05,right: _width*0.05,bottom: _height*0.03),
              child: Text(
                '$bioData',
                style: TextStyle(
                  fontSize:20,
                  fontFamily: Constants.fontfamily,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
              ),
            ),
            GestureDetector(
              onTap: (){

              },
              child: Container(
                height: _height*0.06,
                width: _width*0.7,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('$name Quotes',style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: Constants.fontfamily
                      ),),
                      SizedBox(width: _width*0.02,),
                      Icon(Icons.arrow_forward,color: Colors.white,)
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black
                ),
              ),
            )
          ],
        ),
      ),
    )));
  }
}
