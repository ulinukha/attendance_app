import 'dart:math';

double haversine(double lat1, double lon1, double lat2, double lon2) {
  const R = 6371000; 
  double dLat = _degToRad(lat2 - lat1); 
  double dLon = _degToRad(lon2 - lon1);
  
  double a = sin(dLat / 2) * sin(dLat / 2) +
      cos(_degToRad(lat1)) * cos(_degToRad(lat2)) *
      sin(dLon / 2) * sin(dLon / 2);
  
  double c = 2 * atan2(sqrt(a), sqrt(1 - a));
  
  double distance = R * c; 
  return distance;
}

double _degToRad(double deg) {
  return deg * (pi / 180);
}