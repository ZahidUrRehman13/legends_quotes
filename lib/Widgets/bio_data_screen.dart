import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinch_zoom_image_last/pinch_zoom_image_last.dart';
import 'package:legends_quotes/Utils/Constants.dart';

class BioDataScreen extends StatefulWidget {
  String? imageLink;
  String? name;
  String? designation;
  String? age;
  String? dateOfBirth;
  String? description;
  BioDataScreen({
    required this.imageLink,
    required this.name,
    required this.designation,
    required this.age,
    required this.dateOfBirth,
    required this.description,
  });

  @override
  State<BioDataScreen> createState() => _BioDataScreenState();
}

class _BioDataScreenState extends State<BioDataScreen> {

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
                   widget.imageLink!,
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
                          widget.name!,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: Constants.fontfamily,
                              fontSize: _width*0.05
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          widget.designation!,
                          style: TextStyle(
                              fontFamily: Constants.fontfamily, fontSize: _width*0.04,
                          ),
                          overflow: TextOverflow.ellipsis,
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
                                    fontSize: _width*0.04),
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                width: _width * 0.01,
                              ),
                              Text(
                                '${widget.age.toString()}',
                                style: TextStyle(
                                    fontFamily: Constants.fontfamily,
                                    fontSize: _width*0.03),
                                overflow: TextOverflow.ellipsis,
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
                                    fontSize: _width*0.04),
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                width: _width * 0.01,
                              ),
                              Text(
                                '${widget.dateOfBirth}',
                                style: TextStyle(
                                    fontFamily: Constants.fontfamily,
                                  fontSize: _width*0.03
                                    ),
                                overflow: TextOverflow.ellipsis,

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
              padding: EdgeInsets.only(
                  left: _width * 0.05,
                  right: _width * 0.05,
                  bottom: _height * 0.03),
              child: Text(
                '${widget.description}',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: Constants.fontfamily,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: _height * 0.06,
                width: _width * 0.7,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${widget.name} Quotes',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: Constants.fontfamily),
                      ),
                      SizedBox(
                        width: _width * 0.02,
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black),
              ),
            )
          ],
        ),
      ),
    )));
  }
}
