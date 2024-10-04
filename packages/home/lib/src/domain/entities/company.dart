class Company {
  int? id;
  String? title;
  double? longitude;
  double? latitude;
  int? distance;

  Company({this.id, this.title, this.longitude, this.latitude, this.distance});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    distance = json['distance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    data['distance'] = distance;
    return data;
  }
}