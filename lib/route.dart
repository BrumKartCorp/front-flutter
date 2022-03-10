import 'dart:convert';

import 'package:brum_kart/class/destinations.dart';
import 'package:flutter/material.dart';

import 'MapSample.dart';
import 'package:http/http.dart' as http;

final String jsonplaceholder = "http://srv01.lphn.fr:8001/path/get";

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

Future<ApiResponse> fetchAlbum() async {
  final response = await http
      .get(Uri.parse(jsonplaceholder));

  if (response.statusCode == 200) {
    return ApiResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
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
          FutureBuilder<ApiResponse>(
            future: fetchAlbum(),

            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.name);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          )
        ],
      ),
    );
  }
}