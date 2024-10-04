import 'dart:async';

import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home/home.dart';

part 'beranda_state.dart';
part 'beranda_cubit.freezed.dart';

class BerandaCubit extends Cubit<BerandaState> with SyncEmit<BerandaState> 
  implements BasePageListener<BerandaState> {
  BerandaCubit():super(BerandaState.initial());
  
  @override
  clearErrorState() {
    syncEmit((state) => state.copyWith(failure: null));
  }

  init(bool value) async {
    syncEmit((state) => state.copyWith(isAdmin: value));
    fetchCompanyData();
    if (!state.isAdmin) {
      fetchAttendancesData();
      getGeoLocationPosition();
    }
  }

  fetchCompanyData() {
    DatabaseReference dataRef = FirebaseDatabase.instance.ref().child('company_profile');
    dataRef.onValue.listen((DatabaseEvent event) {
      if (event.snapshot.exists) {
        final value = event.snapshot.value as dynamic;
        if (value != null) {
          var data = Company.fromJson(Map<String, dynamic>.from(value));
          double lat = data.latitude ?? 0;
          double long = data.longitude ?? 0;
          syncEmit((state) => state.copyWith(
            company: data,
          ));
          onUpdateMaps(lat, long);
        }
      } else {
        debugPrint('No data found');
      }
      syncEmit((state) => state.copyWith(status: FormzStatus.submissionSuccess));
    });
  }

  fetchAttendancesData() {
    DatabaseReference dataRef = FirebaseDatabase.instance.ref().child('attendances');
    dataRef.onValue.listen((DatabaseEvent event) {
      if (event.snapshot.exists) {
        Map<dynamic, dynamic>? data = event.snapshot.value as Map?;
        if (data != null) {
          List<Attendance> attendancesData = [];
          
          data.forEach((key, value) {
            attendancesData.add(Attendance.fromJson(Map<String, dynamic>.from(value)));
          });
          syncEmit((state) => state.copyWith(attendances: attendancesData));
        }
      } else {
        debugPrint('No data found');
      }
    });
  }

  onUpdateMaps(double lat, double long) async {
    final GoogleMapController controller = await state.mapsController.future;
    controller.moveCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, long), zoom: 15)));
  }

  Future<Position> getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    Position newPosition = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high));

    return newPosition;
  }

  addAtendance(BuildContext context, SharedStr string) async {
    Position? positon;
    await getGeoLocationPosition().then((value) => {
      positon = value
    });

    if (positon != null) {
      double distance = haversine(
        positon!.latitude, 
        positon!.longitude, 
        state.company.latitude ?? 0, 
        state.company.longitude ?? 0);
      if (distance < 50) {
          final DatabaseReference dataRef = FirebaseDatabase.instance.ref("attendances");
            DatabaseReference newAttendanceRef = dataRef.push();

            Map<String, dynamic> newAttendance = {
              'latitude': positon!.latitude,
              'longitude': positon!.longitude,
              'name': 'user',
              'time': DateTime.now().toIso8601String(),
            };
            
            await newAttendanceRef.set(newAttendance).then((_) {
              showBaseDialog(
                context,
                title: string.success,
                desc: "Success add Attendance",
                isSuccess: true
              );
            }).catchError((error) {
              showBaseDialog(
                context,
                title: string.failed,
                desc: "An error occurred while adding attendance, please try again.",
                isFailed: true
              );
          });
      } else {
        showBaseDialog(
          context,
          title: string.failed,
          desc: "${distance.toStringAsFixed(2)} meter outside the attendance radius. Make sure you are within a 50 meter radius of the location.",
          isFailed: true
        );
      }
    }
  }
}