import 'package:home/home.dart';
import 'package:nav_list/nav_list.dart';
import 'package:navigation/src/util/util_router.dart';

class HomeRoutes extends RootRoute {
  HomeRoutes()
    : super(
      path: HomeNav.beranda.path,
      builder: (context, state) => BerandaPage(
        isAdmin: (state.extra) as String == '1',
      ),
      routes: [
        RootRoute(
          path: HomeNav.setupPoint.path,
          builder: (context, state) => const SetupPointPage(),
        ),
        RootRoute(
          path: HomeNav.attendanceDetail.path,
          builder: (context, state) => const AttendanceDetailPage(),
        ),
      ],
    );
}
