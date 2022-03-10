import 'package:flutter/material.dart';

import '../MapSample.dart';
import '../main.dart';

class AuthentificationView extends StatefulWidget {
  AuthentificationView({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _AuthentificationView createState() => _AuthentificationView();
}

class _AuthentificationView extends State<AuthentificationView> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image(image: AssetImage('assets/images/logo.png')),
              Card(
                elevation: 2,
                child: login()
              )
            ],
          ),
        ),
      ),
    );
  }


  Widget login() {
    return Container(
        margin: EdgeInsets.fromLTRB(100, 10, 100, 10),
      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              autofocus: false,
              style: TextStyle(fontSize: 22.0, color: Color(0xFFbdc6cf)),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Morpheus',
                contentPadding:
                const EdgeInsets.only(left: 14.0, bottom: 12.0, top: 12.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(25.7),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(25.7),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              autofocus: false,
              style: TextStyle(fontSize: 22.0, color: Color(0xFFbdc6cf)),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'HDP',
                contentPadding:
                const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(25.7),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(25.7),
                ),
              ),
            ),
          ),
        Padding(
          padding: EdgeInsets.all(10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color(0xFF911313),
                          Color(0xFFB2362B)
                        ]
                      ),
                    ),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    primary: Colors.white,
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>
                            SimpleMap()
                    ));
                  },
                  child: const Text('Connexion'),
                ),
              ],
            )
          ),
        ),
        TextButton(
          onPressed: () => {

          },
          child: const Text('Inscription'),
        ),
        ],
      )
    );
  }
}