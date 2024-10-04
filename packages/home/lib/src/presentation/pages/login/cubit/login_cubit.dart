import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> with SyncEmit<LoginState> 
  implements BasePageListener<LoginState> {
  LoginCubit():super(LoginState.initial());

  String admin = 'admin';
  String user = 'user';
  String password = '12345';
  
  @override
  clearErrorState() {
    syncEmit((state) => state.copyWith(failure: null));
  }

  onLogin() {
    syncEmit((state) => state.copyWith(status: FormzStatus.submissionInProgress));
    var userValue = state.userId.text;
    var passwordValue = state.password.text;
    if (userValue.isEmpty || passwordValue.isEmpty) {
      syncEmit((state) => state.copyWith(
        status: FormzStatus.submissionFailure,
        errMsg: "User ID & password can't empty"
      ));
    } else if ((userValue == admin || userValue == user) && passwordValue == password) {
      syncEmit((state) => state.copyWith(
        status: FormzStatus.submissionSuccess,
        errMsg: ''
      ));
    } else {
      syncEmit((state) => state.copyWith(
        status: FormzStatus.submissionFailure,
        errMsg: "User ID & password do not match "
      ));
    }
  }
}
