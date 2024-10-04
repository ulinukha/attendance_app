part of '../base_scaffold.dart';

class BaseStatusBar extends StatelessWidget {
  final SystemUiOverlayStyle? overlayStyle;
  const BaseStatusBar({super.key, required this.overlayStyle});

  @override
  Widget build(BuildContext context) {
    if (overlayStyle != null) {
      SystemChrome.setSystemUIOverlayStyle(overlayStyle!);
    }
    return const SizedBox();
  }

  static const system = BaseStatusBar(overlayStyle: null);

  static const light = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Color(0xFF000000),
    systemNavigationBarIconBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.dark,
  );

  static const dark = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Color(0xFF000000),
    systemNavigationBarIconBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  );
}
