import 'package:go_router/go_router.dart';
import 'package:nav_list/nav_list.dart';
import 'package:navigation/src/routes/auth_routes.dart';
import 'package:navigation/src/routes/home_routes.dart';


class MainNavigation extends GoRouter {
  MainNavigation()
      : super(
          routes: [
            AuthRoutes(),
            HomeRoutes()
          ],
          initialLocation: AuthNav.login.fullpath,
          debugLogDiagnostics: true,
        ) {
    // di<AuthLocalDataSource>().listen(
    //   (action, user) {
    //     if (action == AuthLocalDataAction.delete && user == null) {
    //       go(AuthNav.login.fullpath);
    //     }
    //   },
    // );
  }
}
