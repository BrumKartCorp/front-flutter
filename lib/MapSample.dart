
import 'dart:async';
import 'dart:typed_data';

import 'package:brum_kart/Location/DirectionService.dart';
import 'package:brum_kart/class/RaceServices.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'main.dart';
import 'route.dart';
import 'dart:ui' as ui;
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/services.dart' show rootBundle;

class StateFulSimpleMap extends StatefulWidget{
  @override
  State createState() => SimpleMap();

}


class SimpleMap extends State<MyApp> {
  String _mapStyle;
  GoogleMapController mapController;
  List<Marker> markers = [];
  Marker currentMarker;
  bool cameraMove = false;
  bool onRacing = false;
  bool raceButton = true;
  bool cancelButton = false;
  Marker myPosition;
  // List<LatLng> waypointRace = [new LatLng(48.858724, 2.341296), new LatLng(48.857682, 2.345496), new LatLng(48.856939, 2.348214), new LatLng(48.856188, 2.348619), new LatLng(48.855929, 2.347429)];
  List<LatLng> waypointRace = [new LatLng(48.858724, 2.341296), new LatLng(48.857682, 2.345496)];
  RaceServices raceServices = new RaceServices();

  Map<PolylineId, Polyline> polylines = {};

  LatLng currentLocation = const LatLng(48.85749,2.351553);
  LatLng currentCameraLocation;
  LatLng startLocation;
  LatLng endLocation;

  DirectionService directionService = DirectionService();

  @override
  void initState(){
    super.initState();

    rootBundle.loadString('assets/map_style.txt').then((string) {
      _mapStyle = string;
    });
  }

  final LocationSettings locationSettings = LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 10,
  );

  void _onMapCreated(GoogleMapController controller) async{
    mapController = controller;
    controller.setMapStyle(_mapStyle);
    final LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
    );



    Geolocator.getPositionStream(
        locationSettings: locationSettings).listen((Position position) async {
          markers.remove(myPosition);
          currentLocation = new LatLng(position.latitude, position.longitude);

          myPosition = Marker(

            markerId: MarkerId("${currentLocation.latitude}"),
            rotation: 30,
            position: LatLng(

                currentLocation.latitude, currentLocation.longitude),

            icon: BitmapDescriptor.fromBytes(await getBytesFromAsset(

                'assets/images/ScooterMarker.png', 250)),

          );

          markers.add(myPosition);
          setState(() {
          });

          if(!cameraMove){
            mapController.animateCamera(
                CameraUpdate.newCameraPosition(
                    CameraPosition(target: currentLocation, zoom: 20.0)
                )
            );
          }

          if(onRacing){
            List<LatLng> waypointWithCurrentPos = List.from(waypointRace);
            waypointWithCurrentPos.insert(0, currentLocation);
            polylines =  await directionService.getPolyLineRoute(waypointWithCurrentPos);
            if(raceServices.check(currentLocation)){
              if(markers.isNotEmpty){
                markers.removeAt(0);
              }
            }

            if(raceServices.isWin()){
              // Fluttertoast.showToast(
              //     msg: "Victoire",
              //     toastLength: Toast.LENGTH_SHORT,
              //     gravity: ToastGravity.CENTER,
              //     timeInSecForIosWeb: 8,
              //     backgroundColor: Colors.green,
              //     textColor: Colors.white,
              //     fontSize: 70.0
              // );

              showDialog(context: context, builder: (context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  actions: <Widget>[
                    Center(
                      child: Container(
                        child: Image.asset('assets/images/victory.png',
                            width: 120, height: 150),
                      ),
                    ),
                    Center(
                      child: Text(
                        "Victoire", style: TextStyle(fontSize: 50),
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text('Terminer'),
                    ),
                  ],
                );
              });
              waypointRace = [];
              markers = [];
              polylines = {};
              onRacing = false;
              cancelButton = false;
              raceButton = true;
            }

            setState(() {});
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
          title: const Text("Brum'Kart"),
          backgroundColor: Colors.red[700],
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
              myLocationEnabled: false,
              myLocationButtonEnabled: false,
              onMapCreated: _onMapCreated,
              markers: markers.toSet(),
              initialCameraPosition: CameraPosition(
                target: currentLocation,
                zoom: 20.0,
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Visibility(
                  visible: raceButton,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: FloatingActionButton.extended(

                      onPressed: () async {
                        waypointRace = [new LatLng(48.858724, 2.341296), new LatLng(48.857682, 2.345496)];
                        markers = directionService.getMarkerList(waypointRace);
                        polylines = await directionService.getPolyLineRoute(waypointRace);
                        onRacing = true;
                        raceServices.setWayPoint(waypointRace);
                        raceButton = false;
                        cancelButton = true;
                        setState(() {});
                      },

                      label: const Text('Demarrer la course'),
                      icon: Image.asset('assets/images/scooter.png',
                          width: 90, height: 80),
                      backgroundColor: Colors.red,
                    ),
                  ),
                )
            ),

            Align(
                alignment: Alignment.bottomCenter,
                child: Visibility(
                  visible: cancelButton,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: FloatingActionButton(
                      child: cancelButtonImage(),
                      onPressed: ()  {
                        waypointRace = [];
                        markers = [];
                        polylines = {};
                        onRacing = false;
                        raceButton = true;
                        cancelButton = false;
                        setState(() {});
                      },
                    ),
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

  Widget cancelButtonImage() =>  CircleAvatar(
    radius: 110,
    backgroundColor: Colors.black,
    backgroundImage : AssetImage('assets/images/cross.png'),
  );

  targetImage() => CircleAvatar(
    radius: 110,
    backgroundImage: AssetImage('assets/images/target.png'),
    backgroundColor: Colors.white,
  );

  Future<Uint8List> getBytesFromAsset(String path, int width) async {

    ByteData data = await rootBundle.load(path);

    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);

    ui.FrameInfo fi = await codec.getNextFrame();

    return (await fi.image.toByteData(format: ui.ImageByteFormat.png)).buffer.asUint8List();

  }

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

