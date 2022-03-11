import 'package:brum_kart/controller/authentification.dart';
import 'package:brum_kart/MapSample.dart';
import 'package:brum_kart/route.dart';
import 'package:brum_kart/helloworld.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'controller/authentification.dart';
import 'view/authentification_view.dart';




import '3dScooter.dart';

void main(){
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  SimpleMap createState() => new SimpleMap();
}

class _MyAppState extends State<MyApp>  {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 3,
        navigateAfterSeconds: new Authentification(),
        title: new Text('BrumKart 8 Deluxe',
          style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0
          ),
        ),
        image: new Image.asset('assets/images/brumKart.png'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        onClick: ()=>print("Flutter Egypt"),
        loaderColor: Colors.red
    );
  }
}



