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
  final jsonResponse = jsonDecode(response.body);

  return ApiResponse.fromJson(jsonResponse);
}



class ListeRoute extends StatefulWidget {
  ListeRoute({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return new _ListRoute();
  }

}

class _ListRoute extends State<ListeRoute> {

  List<ApiResponse> listModel;


  @override
  void initState() {
    print("init");
      fetch();

  }

  Future<List<ApiResponse>> fetchAlbum() async {
    List<ApiResponse> model = [];
    final response = await http
        .get(Uri.parse(jsonplaceholder));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        for(Map i in data){
          model.add(ApiResponse.fromJson(i));

        }

      });

      return model;

    } else {
      throw Exception('Failed to load album');
    }
  }


  Future<List<ApiResponse>> fetch() async => await fetchAlbum();

  @override
  Widget build(BuildContext context) {
    print(listModel);
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

        ],
      ),
    );
  }
}