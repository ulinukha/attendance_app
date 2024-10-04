class Company {
  int? id;
  String? title;
  String? longitude;
  String? langitude;
  int? distance;

  Company({this.id, this.title, this.longitude, this.langitude, this.distance});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    longitude = json['longitude'];
    langitude = json['langitude'];
    distance = json['distance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['longitude'] = longitude;
    data['langitude'] = langitude;
    data['distance'] = distance;
    return data;
  }
}