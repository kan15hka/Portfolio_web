import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';
import 'package:portfolio/desktop/desktop_screen.dart';
import 'package:portfolio/mobile/mobile_screen.dart';
import 'package:portfolio/tablet/tablet_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    print(h);
    print(w);
    print(1000 / w!);
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 400) {
        return MobileScreen();
      } else if (constraints.maxWidth < 750) {
        return TabletScreen();
      } else {
        return DesktopScreen();
      }
    });
  }
}
