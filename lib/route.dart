import 'dart:convert';

import 'package:brum_kart/class/destinations.dart';
import 'package:flutter/material.dart';

import 'MapSample.dart';
import 'package:http/http.dart' as http;

final String jsonplaceholder = "http://5.196.91.59:8001/path/get";

Future<ApiResponse> fetchInfo() async {
  final response = await http.get(
    Uri.parse(jsonplaceholder),
    headers: <String, String>{
      'Content-Type': 'application/json'
    },
  );
  final jsonResponse = json.decode(response.body);

  return ApiResponse.fromJson(jsonResponse);
}

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
      body: ListView(
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: Text(
                'Listes des Destinations',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25.0),
              ),
            ),
          ),
          FutureBuilder(
            future: fetchInfo(),
            // ignore: missing_return

            // ignore: missing_return
            builder: (context, snapshot){
              if(snapshot.hasData){
                return new Text(snapshot.data[0].checkpoints[0].name);
              } else if(snapshot.hasError) {
                return new Text("Error");
              }
            },
          )
        ],
      ),
    );
  }
}