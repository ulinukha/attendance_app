import 'package:home/home.dart';
import 'package:nav_list/nav_list.dart';
import 'package:navigation/src/util/util_router.dart';

class AuthRoutes extends RootRoute {
  AuthRoutes()
    : super(
      path: AuthNav.login.path,
      builder: (context, state) => const LoginPage(),
      routes: [
      ],
    );
}
