import 'package:flutter/material.dart';
import 'package:shared_str/shared_str.dart';

extension BuildContextExt on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;
  SharedStr get intl => SharedStr.of(this);
}
