import 'dart:developer';

import 'package:brum_kart/entity/User.dart';
import 'package:brum_kart/helper/brumkart_api.dart';
import 'package:flutter/material.dart';
import 'package:brum_kart/view/authentification_view.dart';

class Authentification extends StatefulWidget {
  Authentification({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _Authentification();
  }


}

class _Authentification extends State<Authentification> {



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: AuthentificationView(title: 'Authentification'),
    );
  }
}