import 'package:brum_kart/MapSample.dart';
import 'package:brum_kart/route.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



void main(){
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp>  {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 3,
        navigateAfterSeconds: new AfterSplash(),
        title: new Text('BrumKart 8 Deluxe',
          style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0
          ),
        ),
        image: new Image.asset('assets/images/brumKart.png'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        onClick: ()=>print("Flutter Egypt"),
        loaderColor: Colors.red
    );
  }

  @override
  SimpleMap createState() => SimpleMap();
}

class AfterSplash extends StatelessWidget {
  GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
                builder: (context) =>
                    ListRoute()
            ));
          },
          label: const Text('Demarrer la course'),
          icon: Image.asset('assets/images/scooter.png', width: 90, height: 120,),
          backgroundColor: Colors.red,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}

