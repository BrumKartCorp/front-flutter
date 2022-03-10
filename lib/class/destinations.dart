class ApiResponse {
  final String id;
  final String name;
  final Location start;
  final Location end;

  ApiResponse({this.id, this.name, this.start, this.end});

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
          id: json["id"] == null ? Location() : json["id"],
          name: json["name"]  == null ? Location() : json["name"],
          start: json["start"] == null ? Location() : Location.fromJson(json["start"]),
          end: json["end"] == null ? Location() : Location.fromJson(json["end"])
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