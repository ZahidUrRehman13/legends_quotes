import 'package:flutter/material.dart';


class QuotescategoryScreen extends StatefulWidget {
  final int id;
  final int idOld;
  QuotescategoryScreen({Key? key,required this.id,required this.idOld}) : super(key: key);

  @override
  _QuotescategoryScreenState createState() => _QuotescategoryScreenState();
}

class _QuotescategoryScreenState extends State<QuotescategoryScreen> {

  var listLength;
  var imagesUrl;
  var checkIDS;

  final List billGates =[
    'assets/quotes_data/Fresh/BillGates/BillGateQuote1.png',
    'assets/quotes_data/Fresh/BillGates/BillGateQuote2.png',
    'assets/quotes_data/Fresh/BillGates/BillGateQuote3.png',
    'assets/quotes_data/Fresh/BillGates/BillGateQuote4.png',
  ];

  final List elonMusk = [
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
  ];

  final List jackMa =[
    'assets/quotes_data/Fresh/JackMa/jackmaquote1.jpg',
    'assets/quotes_data/Fresh/JackMa/jackmaquote2.jpg',
    'assets/quotes_data/Fresh/JackMa/jackmaquote3.png',
    'assets/quotes_data/Fresh/JackMa/jackmaquote4.jpg',
    'assets/quotes_data/Fresh/JackMa/jackmaquote5.jpg',
    'assets/quotes_data/Fresh/JackMa/jackmaquote6.jpg',
    'assets/quotes_data/Fresh/JackMa/jackmaquote7.jpg',
    'assets/quotes_data/Fresh/JackMa/jackmaquote8.jpg',
  ];

  final List jefBezos = [
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
  ];

  final List warrenBuffet =[
    'assets/quotes_data/Fresh/WarrenBuffett/WarrenBuffettquotes1.jpg',
    'assets/quotes_data/Fresh/WarrenBuffett/WarrenBuffettquotes2.png',
    'assets/quotes_data/Fresh/WarrenBuffett/WarrenBuffettquotes3.png',
    'assets/quotes_data/Fresh/WarrenBuffett/WarrenBuffettquotes4.png',
    'assets/quotes_data/Fresh/WarrenBuffett/WarrenBuffettquotes5.png',
    'assets/quotes_data/Fresh/WarrenBuffett/WarrenBuffettquotes6.jpg',
    'assets/quotes_data/Fresh/WarrenBuffett/WarrenBuffettquotes7.png',
    'assets/quotes_data/Fresh/WarrenBuffett/WarrenBuffettquotes8.jpg',
    'assets/quotes_data/Fresh/WarrenBuffett/WarrenBuffettquotes9.png',
    'assets/quotes_data/Fresh/WarrenBuffett/WarrenBuffettquotes10.png',
  ];

  final List albertEinstein =[
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
  ];

  final List bruceLee =[
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
  ];

  final List oscarWilde =[
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
  ];

  final List rumi =[
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
  ];

  final List steveJobs = [
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listLength=0;
    imagesUrl=[];
  (widget.id!=0) ? checkIDS=widget.id: checkIDS=widget.idOld;
    switch(checkIDS) {
      case 1:
       listLength= billGates.length;
       imagesUrl = List.from(billGates);
        break; // without this, the switch statement would execute case 2 also!
      case 2:
        listLength= elonMusk.length;
        imagesUrl = List.from(elonMusk);
        break;
      case 3:
        listLength= jackMa.length;
        imagesUrl = List.from(jackMa);
        break;
      case 4:
        listLength= jefBezos.length;
        imagesUrl = List.from(jefBezos);
        break;
      case 5:
        listLength= warrenBuffet.length;
        imagesUrl = List.from(warrenBuffet);
        break;
      case 6:
        listLength= albertEinstein.length;
        imagesUrl = List.from(albertEinstein);
        break;
      case 7:
        listLength= bruceLee.length;
        imagesUrl = List.from(bruceLee);
        break;
      case 8:
        listLength= oscarWilde.length;
        imagesUrl = List.from(oscarWilde);
        break;
      case 9:
        listLength= rumi.length;
        imagesUrl = List.from(rumi);
        break;
      case 10:
        listLength= steveJobs.length;
        imagesUrl = List.from(steveJobs);
        break;
      default:
        print('zero!');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return new Scaffold(
      body: SafeArea(
        top: true,
        child: new ListView.separated(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
            itemCount: listLength,
            itemBuilder: (BuildContext context, index){
              return ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  margin: EdgeInsets.only(left: 10.0,right: 10.0),
                  child: Image.asset(imagesUrl[index],fit: BoxFit.cover,),
                ),
              );
            }, separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height:_height*0.05 ,);
        },
          ),
      ),
    );
  }
  //
  // Widget _buildVerticalChild(BuildContext context, int index) {
  //   return new Padding(
  //     padding: const EdgeInsets.only(bottom: 10.0),
  //     child:  new ParallaxImage(
  //       extent: 150.0,
  //       image:
  //
  //       new ExactAssetImage(
  //         imagesUrl[index],
  //       ),
  //     ),
  //   );
  // }
}