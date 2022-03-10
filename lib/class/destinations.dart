class ApiResponse {
  final String id;
  final String name;
  final Location start;
  final Location end;

  ApiResponse({this.id, this.name, this.start, this.end});

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
          id: json["id"],
          name: json["name"],
          start: Location.fromJson(json["start"]),
          end: Location.fromJson(json["end"])
      );
}

class Location{
  final String id;
  final String latitude;
  final String longitude;

  Location({this.id, this.latitude, this.longitude});

  factory Location.fromJson(Map<String, dynamic> json) => Location(
      id: json["id"],
      latitude: json["latitude"],
      longitude: json["longitude"],
  );
}