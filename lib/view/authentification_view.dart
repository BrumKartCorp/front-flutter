import 'package:flutter/material.dart';

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
        child: Column(
          children: <Widget>[
            Image(image: AssetImage('assets/logo.png')),
            Card(
              elevation: 2,
              child: login()
            )
          ],
        ),
      ),
    );
  }


  Widget login() {
    return Container(
      margin: EdgeInsets.fromLTRB(100, 10, 100, 10),
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Column(
        children: [
          TextField(
            autofocus: false,
            style: TextStyle(fontSize: 22.0, color: Color(0xFFbdc6cf)),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'Morpheus',
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
          TextField(
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
        ClipRRect(
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
                onPressed: () {},
                child: const Text('Connexion'),
              ),
            ],
          )
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