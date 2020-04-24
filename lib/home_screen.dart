import 'package:eishockey_fantasy_app/about_screen.dart';
import 'package:eishockey_fantasy_app/news_screen.dart';
import 'package:eishockey_fantasy_app/login_screen.dart';
import 'package:eishockey_fantasy_app/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget{
  HomeScreen({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState  extends State<HomeScreen> {
  int _selectedIndex = 0;


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
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("assets/images/LOGO-1.png"),
              //Button für die Registrierung
              FlatButton(
                child: Text(
                  'Registrieren',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                textColor: Colors.white,
                color: Colors.blueGrey,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegistrationScreen()));
                },
              ),
              FlatButton(
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                textColor: Colors.white,
                color: Color.fromRGBO(157, 180, 192, 1.0),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
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
