import 'package:eishockey_fantasy_app/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future main() async {

  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,]);
    return MaterialApp(
      title: 'FantasyKing',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'FantasyKing'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(45),
              child: Title(
                color: Colors.grey,
                child: Text(
                  'Willkommen bei',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 38),
                ),
              ),
            ),
            Image.asset("assets/images/LOGO-1.png"),
            Container(
              padding: EdgeInsets.all(45),
              width: double.infinity,
              child: Title(
                color: Colors.grey,
                child: Text(
                  'das Managerspiel der DEL',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 30,),
                ),
              ),
            ),
            FlatButton(
              child: Text('Los gehts', style:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 16,),),
              textColor: Colors.white,
              color: Colors.blueGrey,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
