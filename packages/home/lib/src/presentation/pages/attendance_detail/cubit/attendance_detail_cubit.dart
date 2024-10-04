import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance_detail_state.dart';
part 'attendance_detail_cubit.freezed.dart';

class AttendanceDetailCubit extends Cubit<AttendanceDetailState> with SyncEmit<AttendanceDetailState> 
  implements BasePageListener<AttendanceDetailState> {
  AttendanceDetailCubit():super(AttendanceDetailState.initial());
  
  @override
  clearErrorState() {
    syncEmit((state) => state.copyWith(failure: null));
  }
}
