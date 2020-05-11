import 'package:eishockey_fantasy_app/about_screen.dart';
import 'package:eishockey_fantasy_app/home_screen.dart';
import 'package:eishockey_fantasy_app/news_screen.dart';
import 'package:eishockey_fantasy_app/registration_screen.dart';
import 'package:eishockey_fantasy_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<LoginScreen> {

  final AuthService _authService =  AuthService();
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

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
                      controller: emailController,
                    ),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Passwort',
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.blueGrey,
                        ),
                      ),
                      controller: passwordController,
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
                      onPressed: ()  async {
                        print('Okay');
                        await _authService.signInEmailPassword(emailController.text, passwordController.text);
                        print(emailController.text + " / " + passwordController.text);
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
                            print('Passworit vergessen');
                            _ackAlert(context);
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

  Future<void> _ackAlert(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Na Passwort vergessen?'),
          content: const Text('Merk dir das scheiss Passwort'),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
