
import 'package:brum_kart/MapSample.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
void main(){
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}


class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  SimpleMap createState() => SimpleMap();
}

