import 'package:flutter/cupertino.dart';

abstract interface class HomeNavigationRepository {
  void pushToLogin(BuildContext context);
  void pushToBeranda(BuildContext context, bool isAdmin);
  void pushToSetupPoint(BuildContext context);
  void pushToAttendanceDetail(BuildContext context);
}
