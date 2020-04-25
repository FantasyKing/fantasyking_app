import 'package:eishockey_fantasy_app/about_screen.dart';
import 'package:eishockey_fantasy_app/home_screen.dart';
import 'package:eishockey_fantasy_app/news_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegistrationScreen extends StatefulWidget {
  RegistrationScreen({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<RegistrationScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 0) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      } else if (_selectedIndex == 1) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AboutScreen()));
      } else if (_selectedIndex == 2) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => NewsScreen()));
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
            Container(
              width: 350,
              child: Card(
                shadowColor: Colors.blueGrey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    TextField(
                      style: TextStyle(
                          color: Colors.blueGrey, fontWeight: FontWeight.w300),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: 'E-Mail Adresse',
                          prefixIcon: Icon(
                            Icons.mail,
                            color: Colors.blueGrey,
                          )),
                    ),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Passwort',
                        prefixIcon: Icon(
                          Icons.vpn_key,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                    FlatButton(
                      child: Text(
                        'Register',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      textColor: Colors.white,
                      color: Color.fromRGBO(157, 180, 192, 1.0),
                      onPressed: () {
                        print('Okay');
                      },
                    ),
                    ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: Text(
                            'Passwort vergessen?',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          onPressed: () {
                            print('Passwort vergessen');
                          },
                        ),
                        FlatButton(
                          child: const Text('Noch kein Account?',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              )),
                          onPressed: () {
                            print('Noch kein Account');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        RegistrationScreen()));
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //Button für die Registrierung
            )
          ],
        ),
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