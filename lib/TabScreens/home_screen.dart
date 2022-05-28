
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:legends_quotes/Utils/Constants.dart';
import 'package:legends_quotes/Widgets/bio_data_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  

  SliverAppBar showSliverAppBar(String screenTitle) {

    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;


    return SliverAppBar(
      toolbarHeight: _height*0.02,
      elevation: 0.0,
      backgroundColor: Colors.white,
      floating: false,
      pinned: true,
      snap: false,

      // title: Text(screenTitle,style: TextStyle(color: Colors.black),),
      bottom:  TabBar(
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(50), // Creates border
            color: Colors.black12), //Change background color from here
        tabs: [
          Tab(
            // icon: Icon(Icons.home),
            child: Text('Fresh',style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold,fontFamily: Constants.fontfamily)),

          ),
          Tab(
            // icon: Icon(Icons.settings),
            child: Text('Cold',style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold,fontFamily: Constants.fontfamily)),
          )
        ],
      ),


    );
  }

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
        body: DefaultTabController(
          length: 2,
          child: TabBarView(

              children: [
            // This CustomScrollView display the Home tab content
            CustomScrollView(
              slivers: [
                // SliverAppBar(
                //   backgroundColor: Colors.greenAccent[400],
                // ),
                showSliverAppBar('Fresh',),

                // Anther sliver widget: SliverList
                SliverList(
                  delegate: SliverChildListDelegate([
                    //  SizedBox(
                    //   height: _height*0.08,
                    //   child: Center(
                    //     child: Text(
                    //       'Home Tab',
                    //       style: TextStyle(fontSize: 40),
                    //     ),
                    //   ),
                    // ),
                    Container(
                      child: SingleChildScrollView(
                        child: GridView.count(
                          physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            crossAxisCount: 2,
                            crossAxisSpacing: 4.0,
                            mainAxisSpacing: 8.0,
                            children: List.generate(choices.length, (index) {
                              return Center(
                                child: SelectCard(choice: choices[index]),
                              );
                            }
                            )
                        ),
                      ),
                    ),
                  ]),

                ),
              ],
            ),

            // This shows the Settings tab content
            CustomScrollView(
              slivers: [
                showSliverAppBar('Cold'),

                // Show other sliver stuff
                SliverList(
                  delegate: SliverChildListDelegate([
                    // Container(
                    //   height: 600,
                    //   color: Colors.blue[200],
                    //   child: const Center(
                    //     child: Text(
                    //       'Settings Tab',
                    //       style: TextStyle(fontSize: 40),
                    //     ),
                    //   ),
                    // ),
                    Container(
                      child: SingleChildScrollView(
                        child: GridView.count(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            crossAxisCount: 2,
                            crossAxisSpacing: 4.0,
                            mainAxisSpacing: 8.0,
                            children: List.generate(choices.length, (index) {
                              return Center(
                                child: SelectCard(choice: choices[index]),
                              );
                            }
                            )
                        ),
                      ),
                    ),
                  ]),
                ),
              ],
            )
          ]),

        ));
  }
}


//   @override
//   Widget build(BuildContext context) {
//     var _height = MediaQuery.of(context).size.height;
//     var _width = MediaQuery.of(context).size.height;
//     return Scaffold(
//       body:  SafeArea(
//         child: Column(
//           children: [
//             Container(
//               child: Container(
//                 margin: EdgeInsets.only(left:_width*0.05,right: _width*0.05,top: _height*0.01 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     MaterialButton(
//                       onPressed: (){
//
//                       },
//                       child: Text('Fresh'),
//                     ),
//                     MaterialButton(
//                       onPressed: (){
//
//                       },
//                       child: Text('Cold'),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             Expanded(
//               child: GridView.count(
//                   shrinkWrap: true,
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 4.0,
//                   mainAxisSpacing: 8.0,
//                   children: List.generate(choices.length, (index) {
//                     return Center(
//                       child: SelectCard(choice: choices[index]),
//                     );
//                   }
//                   )
//               ),
//             )
//           ],
//         ),
//       )
//     );
//   }
// }




class Choice {
   Choice({required this.image});
   String? image;
}

 List<Choice> choices =  <Choice>[
   // Choice(image: Image.asset('assets/elon_musk.jpg')),
   // Choice(image: Image.asset('assets/elon_musk.jpg')),
   // Choice(image: Image.asset('assets/elon_musk.jpg')),
   // Choice(image: Image.asset('assets/elon_musk.jpg')),
   // Choice(image: Image.asset('assets/elon_musk.jpg')),
   // Choice(image: Image.asset('assets/elon_musk.jpg')),
   // Choice(image: Image.asset('assets/elon_musk.jpg')),
   // Choice(image: Image.asset('assets/elon_musk.jpg')),
   // Choice(image: Image.asset('assets/elon_musk.jpg')),
   // Choice(image: Image.asset('assets/elon_musk.jpg')),
   Choice(image: 'assets/billgates.jpg'),
   Choice(image: 'assets/billgates.jpg'),
   Choice(image: 'assets/billgates.jpg'),
   Choice(image: 'assets/billgates.jpg'),
   Choice(image: 'assets/billgates.jpg'),
   Choice(image: 'assets/billgates.jpg'),
   Choice(image: 'assets/billgates.jpg'),
   Choice(image: 'assets/billgates.jpg'),
   Choice(image: 'assets/billgates.jpg'),
   Choice(image: 'assets/billgates.jpg'),
   Choice(image: 'assets/billgates.jpg'),
   Choice(image: 'assets/billgates.jpg'),




];
class SelectCard extends StatelessWidget {
  const SelectCard({Key? key, required this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    final TextStyle? textStyle = Theme
        .of(context)
        .textTheme
        .display1;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>BioDataScreen()));
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: Container(
            height: _height*0.4,
            child: Image.asset('${choice.image}',fit: BoxFit.cover,),
            color: Colors.orange,
          ),
        ),
      ),
    );
  }
}