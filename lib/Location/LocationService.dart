import 'dart:html';
import'dart:math' as Math;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationService{
  getDistanceBetween2Point(LatLng pos1, LatLng pos2){
    return Geolocator.distanceBetween(pos1.latitude, pos1.longitude, pos2.latitude, pos2.longitude);
  }
}