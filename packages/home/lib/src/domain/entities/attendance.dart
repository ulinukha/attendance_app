class Attendance {
  int? id;
  String? name;
  String? longitude;
  String? langitude;
  String? time;

  Attendance({this.id, this.name, this.longitude, this.langitude, this.time});

  Attendance.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    longitude = json['longitude'];
    langitude = json['langitude'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['longitude'] = longitude;
    data['langitude'] = langitude;
    data['time'] = time;
    return data;
  }
}