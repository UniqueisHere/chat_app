import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget windows;
  const ResponsiveLayout({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.windows,
  });

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;

    return LayoutBuilder(
      builder: (context, constraints) {
        if (deviceWidth <= 600) {
          return mobile;
        } else if (deviceWidth > 600 && deviceWidth < 1200) {
          return tablet;
        } else {
          return windows;
        }
      },
    );
  }
}
