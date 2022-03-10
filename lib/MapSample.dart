
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'main.dart';

class SimpleMap extends State<MyApp> {
  GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[700],
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            tooltip: 'Retour',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) =>
                      MyApp()
              ));
            },
          ),
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        ),
      ),
    );
  }
}