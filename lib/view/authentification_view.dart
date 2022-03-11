import 'package:flutter/material.dart';

import '../entity/User.dart';
import '../helper/brumkart_api.dart';
import '../MapSample.dart';
import '../main.dart';

class AuthentificationView extends StatefulWidget {
  AuthentificationView({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _AuthentificationView createState() => _AuthentificationView();
}

class _AuthentificationView extends State<AuthentificationView> {
  final user = TextEditingController();
  final password = TextEditingController();

  User USER;

  getConnection(String user, String password) async {
    User data = await Brumkart.fetchUser(user);
    if (data.password == password) {
      USER = data;
      print("hello");
    } else {
      print("pas hello");
    }
  }

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
              Card(elevation: 2, child: login())
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
                  contentPadding: const EdgeInsets.only(
                      left: 14.0, bottom: 12.0, top: 12.0),
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
                            gradient: LinearGradient(colors: <Color>[
                              Color(0xFF911313),
                              Color(0xFFB2362B)
                            ]),
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
                          print(user.value);
                          getConnection(user.value.text, password.value.text);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => StateFulSimpleMap()),
                          );
                        },
                        child: const Text('Connexion'),
                      )
                    ],
                  )),
            ),
            TextButton(
              onPressed: () => {},
              child: const Text('Inscription'),
            ),
          ],
        ));
  }
}
