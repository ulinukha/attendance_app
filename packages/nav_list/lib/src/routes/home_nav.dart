import 'package:nav_list/src/util/navigation_data.dart';

class HomeNav {
  HomeNav._();
  static const beranda = NavigationData(path: '/beranda');
  static const setupPoint = NavigationData(path: 'setup-point', parent: beranda);
  static const attendanceDetail = NavigationData(path: 'attendance-detail', parent: beranda);
}
