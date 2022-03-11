
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RaceServices{
  List<LatLng> checkpoint;
  DateTime startTime;
  double ACCURACY = 10;


  setWayPoint(List<LatLng> checkpoint){
    this.checkpoint = checkpoint;
  }

  start(){
    startTime = DateTime.now();
  }

  bool check(LatLng currentLocation){
    print(getDistanceBetween2Point(currentLocation, checkpoint.first) - 10);
    if(getDistanceBetween2Point(currentLocation, checkpoint.first) - 10 < 0){
      checkpoint.removeAt(0);
      return true;
    }
    return false;
  }

  getDistanceBetween2Point(LatLng pos1, LatLng pos2){
    return Geolocator.distanceBetween(pos1.latitude, pos1.longitude, pos2.latitude, pos2.longitude);
  }

}