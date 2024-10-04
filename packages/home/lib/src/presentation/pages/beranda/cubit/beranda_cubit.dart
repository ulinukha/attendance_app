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
    if (state.isAdmin) {
      fetchCompanyData();
    } else {
      fetchAttendancesData();
    }
  }

  fetchCompanyData() {
    DatabaseReference dataRef = FirebaseDatabase.instance.ref().child('company_profile');
    dataRef.onValue.listen((DatabaseEvent event) {
      if (event.snapshot.exists) {
        final value = event.snapshot.value as dynamic;
        if (value != null) {
          var data = Company.fromJson(Map<String, dynamic>.from(value));
          double lat = double.parse(data.langitude ?? '0');
          double long = double.parse(data.longitude ?? '0');
          syncEmit((state) => state.copyWith(
            company: data,
          ));
          onUpdateMaps(lat, long);
        }
      } else {
        debugPrint('No data found');
      }
    });
  }

  fetchAttendancesData() {
    DatabaseReference dataRef = FirebaseDatabase.instance.ref().child('attendances');
    dataRef.onValue.listen((DatabaseEvent event) {
      if (event.snapshot.exists) {
        List<dynamic> values = event.snapshot.value as List<dynamic>;
        List<Attendance> attendancesData = [];
        for (var value in values) {
          if (value != null && value is Map) {
            attendancesData.add(Attendance.fromJson(Map<String, dynamic>.from(value)));
          }
        }
        syncEmit((state) => state.copyWith(attendances: attendancesData));
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
}
