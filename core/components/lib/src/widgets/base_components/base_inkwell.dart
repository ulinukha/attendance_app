import 'package:flutter/material.dart';

class BaseInkWell extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  const BaseInkWell({
    required this.onTap,
    required this.child,
    super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      child:child
    );
  }
}