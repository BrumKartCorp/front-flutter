
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



class SimpleMap extends State<MyApp> {
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
                    CameraPosition(target: currentLocation, zoom: 20.0)
                )
            );
          }
    });
  }

  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     home: Scaffold(
  //       body: Stack(
  //         children:[
  //
  //           Align(
  //             alignment: Alignment.bottomRight,
  //             child: Container(
  //               margin: const EdgeInsets.only(right: 5, bottom: 10),
  //               child: FloatingActionButton(
  //                 onPressed: (){
  //
  //                 },
  //                 child : targetImage(),
  //
  //               ),
  //               height: 50,
  //               width: 50,
  //             ),
  //           ),
  //         ],
  //       ),
  //       floatingActionButton: FloatingActionButton.extended(
  //
  //         label: const Text('Demarrer la course'),
  //         icon: Image.asset('assets/images/scooter.png', width: 90, height: 120,),
  //         backgroundColor: Colors.red,
  //       ),
  //       // floatingActionButton: SizedBox(
  //       //   height: 100,
  //       //   child: FloatingActionButton.extended(
  //       //     onPressed: () {
  //       //       Navigator.push(context, MaterialPageRoute(
  //       //           builder: (context) =>
  //       //               ListRoute()
  //       //       ));
  //       //     },
  //       //     label: const Text(
  //       //       'Demarrer la course',
  //       //       style: TextStyle(
  //       //         fontWeight: FontWeight.bold,
  //       //         fontSize: 20
  //       //       ),
  //       //     ),
  //       //     icon: Image.asset('assets/images/scooter.png', width: 90, height: 150,),
  //       //     backgroundColor: Colors.red,
  //       //   ),
  //       // ),
  //     ),
  //   );
  // }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Maps Sample App'),
          backgroundColor: Colors.green[700],
        ),
        body: Stack(
          children: [
            GoogleMap(
              onCameraIdle: () {

              },
              gestureRecognizers: Set()
                ..add(Factory<PanGestureRecognizer>(
                        () => OnPanStartRecognizer(() {
                      cameraMove = true;
                      setState(() {});
                    })
                )),
              zoomControlsEnabled: false,
              polylines: Set<Polyline>.of(polylines.values),
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              onMapCreated: _onMapCreated,
              markers: markers,
              initialCameraPosition: CameraPosition(
                target: currentLocation,
                zoom: 20.0,
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: FloatingActionButton.extended(

                    onPressed: () async {
                      List<LatLng> latlng = [new LatLng(48.85749,2.351553), new LatLng(48.86233,2.334866)];
                      markers = directionService.getMarkerList(latlng);
                      polylines = await directionService.getPolyLineRoute(new LatLng(48.85749,2.351553), new LatLng(48.86233,2.334866));
                      setState(() {});
                    },

                    label: const Text('Demarrer la course'),
                    icon: Image.asset('assets/images/scooter.png',
                        width: 90, height: 80),
                    backgroundColor: Colors.red,
                  ),
                )
            ),

            Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: const EdgeInsets.only(right: 10,top: 10),
                child: FloatingActionButton(

                  child: profileImage(),
                ),
                height: 70,
                width: 70,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: const EdgeInsets.only(right: 8, bottom: 12),
                child: FloatingActionButton(
                  onPressed: (){
                    cameraMove = false;
                    setState(() {});
                  },
                  child : targetImage(),

                ),
                height: 50,
                width: 50,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget profileImage() =>  CircleAvatar(
    radius: 110,
    backgroundColor: Colors.red,
    backgroundImage : AssetImage('assets/images/mario.png'),
  );

  targetImage() => CircleAvatar(
    radius: 110,
    backgroundImage: AssetImage('assets/images/target.png'),
    backgroundColor: Colors.white,

  );


}


class OnPanStartRecognizer extends PanGestureRecognizer {
  Function _callback;

  OnPanStartRecognizer(this._callback);

  @override
  void resolve(GestureDisposition disposition) {
    super.resolve(disposition);
    this._callback();
  }
}

