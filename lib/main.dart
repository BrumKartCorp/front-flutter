import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
          title: const Text('Maps Sample App'),
          backgroundColor: Colors.green[700],
        ),
        body: Stack(
          children: [
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: FloatingActionButton.extended(
                  onPressed: () {
                    // Add your onPressed code here!
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
                 onPressed: (){

                 },
                 child: profileImage(),
               ),
               height: 70,
               width: 70,
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
}
