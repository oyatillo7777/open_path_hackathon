import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;

  const ResponsiveLayout(
      {super.key, required this.mobile, required this.desktop});

  static bool isMobile(BuildContext context) =>
      MediaQuery.sizeOf(context).width < 650;

  static bool isTablet(BuildContext context) =>
      MediaQuery.sizeOf(context).width < 1000 &&
          MediaQuery.sizeOf(context).width >= 650;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width > 1000;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 1000) {
          return mobile;
        } else {
          return desktop;
        }
      },
    );
  }
}
