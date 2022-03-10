
import 'dart:async';

import 'package:brum_kart/Location/DirectionService.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

import 'main.dart';
import 'route.dart';

class SimpleMap extends StatelessWidget {
  GoogleMapController mapController;
  Set<Marker> markers = Set();
  Marker currentMarker;
  bool cameraMove = false;

  Map<PolylineId, Polyline> polylines = {};

  LatLng currentLocation = const LatLng(48.85749,2.351553);
  LatLng currentCameraLocation;
  LatLng startLocation;
  LatLng endLocation;

  DirectionService directionService = DirectionService();


  final LocationSettings locationSettings = LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 10,
  );

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    final LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
    );



    Geolocator.getPositionStream(
        locationSettings: locationSettings).listen((Position position) {
          currentLocation = new LatLng(position.latitude, position.longitude);

          if(!cameraMove){
            mapController.animateCamera(
                CameraUpdate.newCameraPosition(
                    CameraPosition(target: currentLocation, zoom: 15.0)
                )
            );
          }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GoogleMap(
            polylines: Set<Polyline>.of(polylines.values),
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            onMapCreated: _onMapCreated,
            markers: markers,
            initialCameraPosition: CameraPosition(
              target: currentLocation,
              zoom: 15.0,
            ),
          ),

        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            List<LatLng> latlng = [new LatLng(48.85749,2.351553), new LatLng(48.86233,2.334866)];
            markers = directionService.getMarkerList(latlng);
            polylines = await directionService.getPolyLineRoute(new LatLng(48.85749,2.351553), new LatLng(48.86233,2.334866));
          },
          label: const Text('Demarrer la course'),
          icon: Image.asset('assets/images/scooter.png', width: 90, height: 120,),
          backgroundColor: Colors.red,
        ),
    ));
  }


}