import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/foundation.dart';
import 'package:navigation/navigation.dart';
import 'package:home/home.dart';

export 'package:dependency_injection/dependency_injection.dart';

class DependencyInjector {
  //util
  final NavigationModule _navigationModule = NavigationModule();
  //package
  final ComponentsModule _componentsModule = ComponentsModule();
  final HomeModule _homeModule = HomeModule();

  Future<void> injectApp({
    required String baseUrl,
    required String apiAppName,
    required String apiAppKey
  }) async {
    if (kReleaseMode) {
      debugPrint = (String? message, {int? wrapWidth}) {};
    }
    await _componentsModule(di);
    await _navigationModule(di);
    await _homeModule();
  }
}
