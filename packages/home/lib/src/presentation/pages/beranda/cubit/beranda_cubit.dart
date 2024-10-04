import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'beranda_state.dart';
part 'beranda_cubit.freezed.dart';

class BerandaCubit extends Cubit<BerandaState> with SyncEmit<BerandaState> 
  implements BasePageListener<BerandaState> {
  BerandaCubit():super(BerandaState.initial());
  
  @override
  clearErrorState() {
    syncEmit((state) => state.copyWith(failure: null));
  }
}
