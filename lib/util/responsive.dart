import 'package:flutter/material.dart';
import 'package:memory_game/util/size_configure.dart';

class Responsive extends StatelessWidget {
  static double _minDesktopWidth = 800;

  final Widget mobile;
  final Widget desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    required this.desktop,
  }) : super(key: key);

  static bool isMobile(BuildContext context) => SizeConfigure.screenWidth < _minDesktopWidth;

  static bool isDesktop(BuildContext context) => SizeConfigure.screenWidth >= _minDesktopWidth;

  @override
  Widget build(BuildContext context) {
    if (SizeConfigure.screenWidth >= _minDesktopWidth) {
      return desktop;
    } else {
      return mobile;
    }
  }
}
