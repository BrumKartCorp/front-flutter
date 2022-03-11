
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';


class RaceServices{
  List<LatLng> checkpoint;
  List<LatLng> truePath;
  DateTime startTime;
  double ACCURACY = 15;


  setWayPoint(List<LatLng> checkpoint){
    this.truePath = List.from(checkpoint);
    this.checkpoint = checkpoint;
  }

  start(){
    print("Race started");
    startTime = DateTime.now();
  }

  bool check(LatLng currentLocation){
    print(getDistanceBetween2Point(currentLocation, checkpoint.first) - 10);
    if(getDistanceBetween2Point(currentLocation, checkpoint.first) - 10 < 0){
      if(this.truePath[0] == this.checkpoint[0]){
        Fluttertoast.showToast(
            msg: "3",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 2,
            backgroundColor: Colors.transparent,
            textColor: Colors.black,
            fontSize: 70.0
        );

        Future.delayed(Duration(seconds: 3), (){
          Fluttertoast.showToast(
              msg: "2",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 2,
              backgroundColor: Colors.transparent,
              textColor: Colors.black,
              fontSize: 70.0
          );
        });

        Future.delayed(Duration(seconds: 6), (){
          Fluttertoast.showToast(
              msg: "1",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 2,
              backgroundColor: Colors.transparent,
              textColor: Colors.black,
              fontSize: 70.0
          );
        });
        Future.delayed(Duration(seconds: 9), (){
          Fluttertoast.showToast(
              msg: "GO!",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 2,
              backgroundColor: Colors.transparent,
              textColor: Colors.black,
              fontSize: 70.0
          );
        });
      }
      checkpoint.removeAt(0);
      return true;
    }
    return false;
  }

  bool isWin(){
    if(checkpoint.length == 0){
      return true;
    }

    return false;
  }



  getDistanceBetween2Point(LatLng pos1, LatLng pos2){
    return Geolocator.distanceBetween(pos1.latitude, pos1.longitude, pos2.latitude, pos2.longitude);
  }

}