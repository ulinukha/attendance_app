import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:home/home.dart';
import 'package:nav_list/nav_list.dart';

class HomeNavigationRepositoryImpl implements HomeNavigationRepository {
  @override
  void pushToLogin(BuildContext context) {
    context.push(AuthNav.login.fullpath);
  }
  
  @override
  void pushToAttendanceDetail(BuildContext context) {
    context.push(HomeNav.attendanceDetail.fullpath);
  }
  
  @override
  void pushToBeranda(BuildContext context) {
    context.replace(HomeNav.beranda.fullpath);
  }
  
  @override
  void pushToSetupPoint(BuildContext context) {
    context.push(HomeNav.setupPoint.fullpath);
  }
}
