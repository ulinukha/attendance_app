import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:home/home.dart';
import 'package:nav_list/nav_list.dart';

class HomeNavigationRepositoryImpl implements HomeNavigationRepository {
  @override
  void pushToLogin(BuildContext context) {
    context.replace(AuthNav.login.fullpath);
  }
  
  @override
  void pushToAttendanceDetail(BuildContext context) {
    context.push(HomeNav.attendanceDetail.fullpath);
  }
  
  @override
  void pushToBeranda(BuildContext context, bool isAdmin) {
    context.go(HomeNav.beranda.fullpath, extra: isAdmin ? '1' : '0');
  }
  
  @override
  void pushToSetupPoint(BuildContext context) {
    context.push(HomeNav.setupPoint.fullpath);
  }
}
