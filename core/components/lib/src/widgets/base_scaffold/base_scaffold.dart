import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
part 'widgets/base_status_bar.dart';

class DesignScaffold extends StatelessWidget {
  final Widget? appBar;
  final Widget? body;
  final Color? backgroundColor;
  final Widget? bottomNavigationBar;
  final bool withSafeArea;
  final bool clearSafeArea;
  final bool extendBodyBehindAppBar;
  final SystemUiOverlayStyle statusBar;
  final Widget? floatingActionButton;
  const DesignScaffold({
    super.key,
    this.appBar,
    this.body,
    this.backgroundColor,
    this.bottomNavigationBar,
    this.withSafeArea = true,
    this.clearSafeArea = true,
    this.extendBodyBehindAppBar = false,
    this.statusBar = BaseStatusBar.dark,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    final hasAppBar = appBar != null;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: statusBar,
      child: Scaffold(
        backgroundColor: backgroundColor ?? Colors.white,
        bottomNavigationBar: bottomNavigationBar,
        extendBodyBehindAppBar: extendBodyBehindAppBar,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: GestureDetector(
          child: Stack(
            children: [
              SizedBox(
                width: context.screenWidth,
                height: context.screenHeight,
                child: Image.asset(
                  Assets.bg,
                  fit: BoxFit.cover,
                ),
              ),
              _DesignScaffoldSafeArea(
                withSafeArea: withSafeArea,
                hasAppBar: hasAppBar,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (hasAppBar)
                      SafeArea(
                        child: appBar!,
                      ),
                    if (body != null)
                      Expanded(
                        child: MediaQuery.removePadding(
                          context: context,
                          removeTop: clearSafeArea,
                          removeLeft: clearSafeArea,
                          removeRight: clearSafeArea,
                          removeBottom: clearSafeArea,
                          child: body!,
                        ),
                      )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _DesignScaffoldSafeArea extends StatelessWidget {
  final bool withSafeArea;
  final bool hasAppBar;
  final Widget child;
  const _DesignScaffoldSafeArea(
      {required this.withSafeArea,
      required this.hasAppBar,
      required this.child});

  @override
  Widget build(BuildContext context) {
    if (withSafeArea) return SafeArea(child: child);
    return child;
  }
}
