class Attendance {
  int? id;
  String? name;
  double? longitude;
  double? latitude;
  String? time;

  Attendance({this.id, this.name, this.longitude, this.latitude, this.time});

  Attendance.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    data['time'] = time;
    return data;
  }
}