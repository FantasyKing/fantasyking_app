import 'package:eishockey_fantasy_app/about_screen.dart';
import 'package:eishockey_fantasy_app/home_screen.dart';
import 'package:eishockey_fantasy_app/news_screen.dart';
import 'package:eishockey_fantasy_app/login_screen.dart';
import 'package:eishockey_fantasy_app/registration_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';


const Color _colorOne = Color(0x33000000);
const Color _colorTwo = Color(0x24000000);
const Color _colorThree = Color(0x1F000000);

class AboutScreen extends StatefulWidget{
  AboutScreen({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState  extends State<AboutScreen> {
  int _selectedIndex = 0;

  final Map<int, Widget> logoWidgets = const <int, Widget>{
    0: Text('Das Projekt'),
    1: Text('Das Team'),
  };

  final Map<int, Widget> icons = const <int, Widget>{
    0: Align(
      child:Text (
        'Den Ursprung hat der FantasySport 1960 in den USA.'
      ),
    ),
    1: Center(
      child: FlutterLogo(
        colors: Colors.teal,
        size: 200.0,
      ),
    ),
  };

  int sharedValue = 0;


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if(_selectedIndex == 0){
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }else if(_selectedIndex == 1){

        Navigator.push(context, MaterialPageRoute(builder: (context) => AboutScreen()));

      }else if(_selectedIndex == 2){

        Navigator.push(context, MaterialPageRoute(builder: (context) => NewsScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);


    return Scaffold(
      appBar: AppBar(
        title: const Text('Über das Projekt und uns'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(

        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(8.0),
              ),
              CupertinoSegmentedControl<int>(
                children: logoWidgets,
                onValueChanged: (int val){
                  setState((){
                    sharedValue = val;
                  });
                },
                groupValue: sharedValue,
              ),
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 30.0,
                      horizontal: 16.0,
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 64.0,
                        horizontal: 16.0,
                      ),
                      decoration: BoxDecoration(
                        color: CupertinoColors.white,
                        borderRadius: BorderRadius.circular(3.0),
                        boxShadow: const <BoxShadow>[
                          BoxShadow(
                            offset: Offset(0.0, 3.0),
                            blurRadius: 5.0,
                            spreadRadius: -1.0,
                            color: _colorOne,
                          ),
                          BoxShadow(
                            offset: Offset(0.0, 6.0),
                            blurRadius: 10.0,
                            spreadRadius: 0.0,
                            color: _colorTwo,
                          ),
                          BoxShadow(
                            offset: Offset(0.0, 1.0),
                            blurRadius: 18.0,
                            spreadRadius: 0.0,
                            color: _colorThree,
                          ),
                        ]
                      ),
                      child: icons[sharedValue],
                    ),
              ),
              ),
            ]),
      ),



      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            title: Text('About'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.new_releases),
            title: Text('News'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueGrey,
        onTap: _onItemTapped,
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    throw UnimplementedError();
  }

}
