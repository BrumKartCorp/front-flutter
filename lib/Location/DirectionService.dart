import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

const apiKey = "AIzaSyDKjhRwkC0zTWqN7ILl2w3y_ULU2AaM8JI";

class DirectionService{
  Future<String> getRouteCoordinates(LatLng l1, LatLng l2)async{
    String url = "https://maps.googleapis.com/maps/api/directions/json?origin=${l1.latitude},${l1.longitude}&destination=${l2.latitude},${l2.longitude}&key=$apiKey";
    http.Response response = await http.get(Uri.parse(url));
    Map values = jsonDecode(response.body);
    return values["routes"][0]["overview_polyline"]["points"];
  }

  List<Marker> getMarkerList(List<LatLng> latlngs){
    List<Marker> markers = [];
    int i = 0;
    latlngs.forEach((element) {
      Marker marker;

      if (i == 0){
        marker = Marker( //add start location marker
          markerId: MarkerId(element.toString()),
          position: element, //position of marker
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan), //Icon for Marker
        );
      }
      else if (i == latlngs.length - 1){
        marker = Marker( //add start location marker
          markerId: MarkerId(element.toString()),
          position: element, //position of marker
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen), //Icon for Marker
        );
      }
      else {
        marker = Marker( //add start location marker
          markerId: MarkerId(element.toString()),
          position: element, //position of marker
          icon: BitmapDescriptor.defaultMarker //Icon for Marker
        );
      }
      markers.add(marker);

      i++;
    });

    return markers;
  }

  Future<PolylineResult> getPolylineResult(List<LatLng> waypoint) async{
    print(waypoint.toString());

    LatLng start = waypoint.first;
    LatLng end = waypoint.last;

    waypoint.removeAt(0);
    waypoint.removeAt(waypoint.length - 1);

    List<PolylineWayPoint> waypoints = [];
    waypoint.forEach((element) {waypoints.add(new PolylineWayPoint(location: element.latitude.toString() + "," + element.longitude.toString()));});

    PolylinePoints polylinePoints = PolylinePoints();
    return polylinePoints.getRouteBetweenCoordinates(
      apiKey,
      PointLatLng(start.latitude, start.longitude),
      PointLatLng(end.latitude, end.longitude),
      wayPoints: waypoints,
      travelMode: TravelMode.driving);
  }

  List<LatLng> getPolylineCoordinate(PolylineResult polylineResult){
    List<LatLng> polylineCoordinates = [];

    if (polylineResult.points.isNotEmpty) {
      polylineResult.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(polylineResult.errorMessage);
    }

    return polylineCoordinates;
  }

  Map<PolylineId, Polyline> getPolyline(List<LatLng> polylineCoordinates){
    Map<PolylineId, Polyline> polylines = {};

    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.deepPurpleAccent,
      points: polylineCoordinates,
      width: 8,
    );
    polylines[id] = polyline;

    return polylines;
  }

  Future<Map<PolylineId, Polyline>> getPolyLineRoute(List<LatLng> waypointRace) async {
      List<LatLng> waypoint = List.from(waypointRace);
      PolylineResult resultApi = await getPolylineResult(waypoint);
      List<LatLng> polylineCoordinates = getPolylineCoordinate(resultApi);
      return getPolyline(polylineCoordinates);
  }
}