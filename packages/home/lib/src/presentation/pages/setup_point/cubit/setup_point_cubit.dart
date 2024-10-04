import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'setup_point_state.dart';
part 'setup_point_cubit.freezed.dart';

class SetupPointCubit extends Cubit<SetupPointState> with SyncEmit<SetupPointState> 
  implements BasePageListener<SetupPointState> {
  SetupPointCubit():super(SetupPointState.initial());
  
  @override
  clearErrorState() {
    syncEmit((state) => state.copyWith(failure: null));
  }
}
