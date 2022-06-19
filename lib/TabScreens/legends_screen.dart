import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:legends_quotes/Utils/Constants.dart';
import 'package:legends_quotes/Utils/notification.dart';
import 'package:legends_quotes/Widgets/bio_data_screen.dart';

class LegendsScreen extends StatefulWidget {
  const LegendsScreen({Key? key}) : super(key: key);

  @override
  State<LegendsScreen> createState() => _LegendsScreenState();
}

class _LegendsScreenState extends State<LegendsScreen> {
  int idI =0;
  final FlutterLocalNotificationsPlugin localNotifications =
  FlutterLocalNotificationsPlugin();
  bool fresh = true;

  int _incrementCounter() {
    return idI;
  }
  // @override
  // void initState() {
  //   super.initState();
  //   Notifications().showNotification(
  //       localNotifications,
  //       _incrementCounter(),
  //       "Legends Quotes",
  //       "Quotes of the Day",
  //       "Smart"
  //   );
  //
  // }
  final List<String> imageUrlList = <String>[
    'assets/quotes_data/Fresh/BillGates/BillGatesProfile_main.jpg',
    'assets/Elon_musk_fie_screen_image.png',
    'assets/quotes_data/Fresh/JackMa/JackMaProfile.jpg',
    'assets/jef_bezos.jpg',
    'assets/quotes_data/Fresh/WarrenBuffett/warrenbuffettprofile.jpg',
  ];
  final List<String> nameList = <String>[
    'BillGates',
    'Elon Musk',
    'JackMa',
    'Jef Bezos',
    'Warren Buffet',
  ];
  final List<int> id = <int>[
    1,
    2,
    3,
    4,
    5,
  ];
  final List<String> designationList = <String>[
    'CEO of Microsoft',
    'CEO Tesla Motors',
    'CEO Alibaba Group',
    'CEO of Amazon',
    'CEO Berkshire Hathaway',
  ];
  final List<String> ageList = <String>[
    "66",
    "50",
    "57",
    "58",
    "91",
  ];

  final List<String> dateOfBirthList = <String>[
    'October 28, 1955',
    'June 28, 1971',
    '10 September 1964',
    'January 12, 1964',
    'August 30, 1930',
  ];
  final List<String> descriptionList = <String>[
    "Born William Henry III is an American entrepreneur, business mogul, investor, philanthropist, "
        "and widely known as one of the most richest and influential people in the world. "
        "William Henry III was born to attorney, William Henry II and teacher,"
        " Mary Maxwell Gates in Seattle, Washington, USA.",
    "Musk was born to White South African parents in Pretoria, "
        "where he grew up. He briefly attended the University of Pretoria before moving to Canada at age 17,"
        " acquiring citizenship through his Canadian-born mother."
        " He matriculated at Queen's University and transferred to the University of Pennsylvania two years later,"
        " where he received a bachelor's degree in Economics and Physics."
        " He moved to California in 1995 to attend Stanford University"
        " but decided instead to pursue a business career, co-founding the web software company Zip2 with his brother Kimbal."
        " The startup was acquired by Compaq for \$307 million in 1999."
        " The same year, Musk co-founded online bank X.com, which merged with Confinity in 2000 to form PayPal."
        " The company was bought by eBay in 2002 for \$1.5 billion.",
    "JackMa was born in Hangzhou, Zhejiang, China. He began studying English at a"
        " young age by conversing with English-speakers at Hangzhou International Hotel."
        " For nine years, Ma would ride 27 km (17 miles) on his bicycle to give tourists tours of the area to practice his English."
        " He became pen pals with one of those foreigners, who nicknamed him "
        "Jack because he found it hard to pronounce his Chinese name",
    "Bezos Born in Albuquerque and raised in Houston and Miami, Bezos graduated from Princeton University in 1986."
        " He holds a degree in electrical engineering and computer science. "
        "He worked on Wall Street in a variety of related fields from 1986 to early 1994."
        " Bezos founded Amazon in late 1994, on a road trip from New York City to Seattle."
        " The company began as an online bookstore and has since expanded to a variety of other e-commerce products and services, "
        "including video and audio streaming, cloud computing, and artificial intelligence. "
        "It is currently the world's largest online sales company, the largest Internet company by revenue,"
        " and the largest provider of virtual assistants and cloud infrastructure services through its Amazon Web Services branch.",
    "Buffett was born in Omaha, Nebraska. He developed an interest in business and investing in his youth,"
        " eventually entering the Wharton School of the University of Pennsylvania in 1947 before transferring to "
        "and graduating from the University of Nebraska at 19. He went on to graduate from Columbia Business School,"
        " where he molded his investment philosophy around the concept of value investing pioneered by Benjamin Graham. "
        "He attended New York Institute of Finance to focus his economics background and soon after began various business"
        " partnerships, including one with Graham. He created Buffett Partnership,"
        " Ltd in 1956 and his firm eventually acquired a textile manufacturing firm called Berkshire Hathaway, "
        "assuming its name to create a diversified holding company."
        " In 1978, Charlie Munger joined Buffett as vice-chairman",
  ];

  //Old Quotes Data
  final List<String> imageUrlListOld = <String>[
    'assets/quotes_data/Gold/AlbertEinstein/Albert Einstein Profile.jpg',
    'assets/quotes_data/Gold/BruceLee/BruceLeeProfile.jpg',
    'assets/quotes_data/Gold/OscarWilde/oscarwildeprofile.jpg',
    'assets/quotes_data/Gold/Rumi/RumiProfile.png',
    'assets/quotes_data/Gold/SteveJobs/Steve Jobs Profile.jpg',
  ];
  final List<String> nameListOld = <String>[
    'Albert Einstein',
    'Bruce Lee',
    'Oscar Wilde',
    'Muhammad Rumi',
    'Steve Jobs',
  ];
  final List<int> idOld = <int>[
    6,
    7,
    8,
    9,
    10,
  ];

  final List<String> designationListOld = <String>[
    'Co-Founder of Modern Physics',
    'Martial artist',
    'Author,poet,playwright',
    'Persian Poet',
    'CEO of NeXT',
  ];
  final List<String> ageListOld = <String>[
    "76",
    "32",
    "46",
    "66",
    "56",
  ];

  final List<String> dateOfBirthListOld = <String>[
    '14 March 1879',
    '27 November, 1940',
    '16 October 1854',
    '30 September 1207',
    '24 February, 1955',
  ];
  final List<String> descriptionListOld = <String>[
    "Einstein was born in the German Empire, but moved to Switzerland in 1895, "
        "forsaking his German citizenship (as a subject of the Kingdom of Württemberg)[note 1] "
        "the following year. In 1897, at the age of 17, he enrolled in the mathematics and physics teaching"
        " diploma program at the Swiss Federal polytechnic school in Zürich, graduating in 1900. In 1901, "
        "he acquired Swiss citizenship, which he kept for the rest of his life, "
        "and in 1903 he secured a permanent position at the Swiss Patent Office in Bern. In 1905, "
        "he was awarded a PhD by the University of Zurich. In 1914,"
        " Einstein moved to Berlin in order to join the Prussian Academy of Sciences and the Humboldt University of Berlin. "
        "In 1917, Einstein became director of the Kaiser Wilhelm Institute for Physics;"
        " he also became a German citizen again, this time Prussian.",
    " Bruce Lee was born in San Francisco in 1940 during his father's opera tour abroad. The Lee family "
        "returned to Hong Kong a few months later. He was introduced to the Hong Kong film industry as a child "
        "actor by his father. However these were not martial art films. His early martial arts experience included "
        "Wing Chun (trained under Yip Man), tai chi, boxing (winning a Hong Kong boxing tournament),"
        " and apparently frequent street fighting (neighbourhood and rooftop fights). In 1959,"
        " Lee, having U.S. citizenship due to his birth, was able to move to Seattle. In 1961,"
        " he enrolled in the University of Washington.[4] "
        "It was during this time in the United States that he began considering making money by teaching martial "
        "arts even though he aspired to an acting career. He opened his first martial arts school,"
        " operated out of home in Seattle.",
    "Oscar Wilde was an Irish poet and playwright. After writing in different forms throughout the 1880s,"
        " he became one of the most popular playwrights in London in the early 1890s. "
        "He is best remembered for his epigrams and plays, his novel The Picture of Dorian Gray,",
    "Rumi (30 September 1207 – 17 December 1273), was a 13th-century Persian "
        "poet, Hanafi faqih, Islamic scholar,"
        " Maturidi theologian, and Sufi mystic originally from Greater Khorasan in Greater Iran."
        " Rumi's influence transcends national borders and ethnic divisions: Iranians, Tajiks, Turks,"
        " Greeks, Pashtuns, other Central Asian Muslims, and the Muslims of the Indian subcontinent have "
        "greatly appreciated his spiritual legacy for the past seven centuries.[14] His poems have been "
        "widely translated into many of the world's languages and transposed into various formats."
        " Rumi has been described as the most popular poet and the best selling poet in the United State",
    "Steve Jobs was an American entrepreneur, inventor, business magnate, media proprietor,"
        " and investor. He was the co-founder, chairman, and CEO of Apple; "
        "the chairman and majority shareholder of Pixar; a member of The Walt Disney"
        " Company's board of directors following its acquisition of Pixar; and the founder, chairman, and CEO of NeXT.",
  ];

  SliverAppBar showSliverAppBar(String screenTitle) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;

    return SliverAppBar(
      toolbarHeight: _height * 0.02,
      elevation: 0.0,
      backgroundColor: Colors.white,
      floating: false,
      pinned: true,
      snap: false,

      // title: Text(screenTitle,style: TextStyle(color: Colors.black),),
      bottom: TabBar(
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(50), // Creates border
            color: Colors.black12), //Change background color from here
        tabs: [
          Tab(
            // icon: Icon(Icons.home),
            child: Text('Fresh',
                style: TextStyle(
                    color: Color(0xFFe60000),
                    fontWeight: FontWeight.bold,
                    fontFamily: Constants.fontfamily)),
          ),
          Tab(
            // icon: Icon(Icons.settings),
            child: Text('Gold',
                style: TextStyle(
                    color: Color(0xFFe60000),
                    fontWeight: FontWeight.bold,
                    fontFamily: Constants.fontfamily)),
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
          child: TabBarView(children: [
            // This CustomScrollView display the Home tab content
            CustomScrollView(
              slivers: [
                // SliverAppBar(
                //   backgroundColor: Colors.greenAccent[400],
                // ),
                showSliverAppBar(
                  'Fresh',
                ),

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
                            children:
                                List.generate(imageUrlList.length, (index) {
                              return Center(
                                child: SelectCard(
                                  image: imageUrlList[index],
                                  name: nameList[index],
                                  designation: designationList[index],
                                  age: ageList[index],
                                  dateofBirth: dateOfBirthList[index],
                                  description: descriptionList[index],
                                  id:id[index],
                                  idOld:0,
                                ),
                              );
                            })),
                      ),
                    ),
                  ]),
                ),
              ],
            ),

            // This shows the Settings tab content
            CustomScrollView(
              slivers: [
                showSliverAppBar('Gold',),

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
                            children:
                                List.generate(imageUrlList.length, (index) {
                              return Center(
                                child: SelectCard(
                                  image: imageUrlListOld[index],
                                  name: nameListOld[index],
                                  designation: designationListOld[index],
                                  age: ageListOld[index],
                                  dateofBirth: dateOfBirthListOld[index],
                                  description: descriptionListOld[index],
                                  id: 0,
                                  idOld: idOld[index],
                                ),
                              );
                            })),
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

// class Choice {
//   Choice({required this.image});
//   String? image;
// }
//
// List<Choice> choices = <Choice>[
//   Choice(image: 'assets/billgates.jpg'),
//   Choice(image: 'assets/Elon_musk_fie_screen_image.png'),
//   Choice(image: 'assets/jack_ma_slider_img.jpg'),
//   Choice(image: 'assets/jef_bezos.jpg'),
//   Choice(image: 'assets/warren_buffet.jpg'),
//   Choice(image: 'assets/billgates.jpg'),
//   Choice(image: 'assets/billgates.jpg'),
//   Choice(image: 'assets/billgates.jpg'),
//   Choice(image: 'assets/billgates.jpg'),
//   Choice(image: 'assets/billgates.jpg'),
//   Choice(image: 'assets/billgates.jpg'),
//   Choice(image: 'assets/billgates.jpg'),
// ];

class SelectCard extends StatelessWidget {
  SelectCard({
    Key? key,
    required this.image,
    required this.name,
    required this.designation,
    required this.age,
    required this.dateofBirth,
    required this.description,
    required this.id,
    required this.idOld,
  }) : super(key: key);
  final String image;
  final String name;
  final String designation;
  final String age;
  final String dateofBirth;
  final String description;
  final int id;
  final int idOld;

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    // final TextStyle? textStyle = Theme.of(context).textTheme.display1;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BioDataScreen(
                        image,
                        name,
                        designation,
                        age,
                        dateofBirth,
                        description,
                        id,
                        idOld,
                      )));
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: Container(
            height: _height * 0.4,
            decoration: BoxDecoration(
                color: Colors.black12,
              image: DecorationImage(

                image: AssetImage(
                  '$image',
                ),
                fit: BoxFit.cover
              )
            ),
            // child: Image.asset(
            //   '$image',
            //   fit: BoxFit.fill,
            // ),
            // color: Colors.black12,
          ),
        ),
      ),
    );
  }
}
