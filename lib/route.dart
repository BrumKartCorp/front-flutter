import 'package:flutter/material.dart';

import 'MapSample.dart';
import 'main.dart';

class ListRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            tooltip: 'Retour',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) =>
                      SimpleMap()
              ));
            },
          ),
          automaticallyImplyLeading: false
      ),
      body: new Center(
        child: new Text("Il y aura ici une liste de destination!",
          style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30.0
          ),
        ),
      ),
    );
  }
}