import 'package:common_dependency/common_dependency.dart';
import 'package:env/env.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:dependency_injection/dependency_injection.dart';
import 'package:navigation/navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjector().injectApp(
    baseUrl: "",
    apiAppKey: Env.appKey,
    apiAppName: Env.appName
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

final _router = MainNavigation();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp.router(
              restorationScopeId: 'app',
              debugShowCheckedModeBanner: false,
              routerConfig: _router,
              title: 'Attendance',
              themeMode: ThemeMode.light,
              localizationsDelegates: const [
                SharedStr.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
            );
      },
    );
  }
}