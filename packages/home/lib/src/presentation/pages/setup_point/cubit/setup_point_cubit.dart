import 'dart:async';

import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home/home.dart';

part 'setup_point_state.dart';
part 'setup_point_cubit.freezed.dart';

class SetupPointCubit extends Cubit<SetupPointState> with SyncEmit<SetupPointState> 
  implements BasePageListener<SetupPointState> {
  SetupPointCubit():super(SetupPointState.initial());
  
  @override
  clearErrorState() {
    syncEmit((state) => state.copyWith(failure: null));
  }

  init() async {
    fetchCompanyData();
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
            longLat: LatLng(lat, long)
          ));
          onUpdateMaps(lat, long);
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

  void updateCompanyLongLat() {
    syncEmit((state) => state.copyWith(status: FormzStatus.submissionInProgress));
    DatabaseReference dataRef = FirebaseDatabase.instance.ref().child('company_profile');

    Map<String, dynamic> updatedData = {
      'langitude': state.longLat.latitude.toString(), 
      'longitude': state.longLat.longitude.toString(),
    };

    dataRef.update(updatedData).then((_) {
      syncEmit((state) => state.copyWith(
        status: FormzStatus.submissionSuccess,
      ));
    }).catchError((error) {
      syncEmit((state) => state.copyWith(
        status: FormzStatus.submissionFailure,
      ));
    });
  }

  onUpdateLatLong(LatLng value) {
    syncEmit((state) => state.copyWith(longLat: value));
  }
}
