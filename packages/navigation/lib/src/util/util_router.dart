import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension ExtendedGo on BuildContext {
  void goExtra(String path,
      {Map<String, String> params = const {},
      Map<String, dynamic> extra = const {}}) {
    go(path.setPathParams(params: params, queryParams: extra));
  }

  Future<T?> pushExtra<T>(
    String path, {
    Map<String, String> params = const {},
    Map<String, String> extra = const {},
  }) =>
      push(path.setPathParams(params: params, queryParams: extra));
}

extension PathFormatter on String {
  String setPathParams(
      {Map<String, String> params = const {},
      Map<String, dynamic> queryParams = const {}}) {
    String result = this;
    for (final name in params.keys) {
      result = result.replaceAll(':$name', params[name] ?? '');
    }
    return Uri(path: result, queryParameters: queryParams).toString();
  }
}

class RestorableShell extends ShellRoute {
  RestorableShell({
    required String restorableId,
    Widget Function(BuildContext, GoRouterState, Widget)? builder,
    super.routes,
    super.navigatorKey,
  }) : super(
            pageBuilder: (context, state, widget) => MaterialPage(
                restorationId: restorableId,
                child: builder!(context, state, widget)));
}

class RootRoute extends GoRoute {
  RootRoute({
    required super.path,
    super.name,
    Widget Function(BuildContext, GoRouterState)? builder,
    Page<dynamic> Function(BuildContext, GoRouterState)? pageBuilder,
    super.redirect,
    super.routes = const <RouteBase>[],
  }) : super(
          pageBuilder: pageBuilder ??
              (context, state) => MaterialPage(
                    restorationId: state.location,
                    child: builder!(context, state),
                  ),
        );
}
