import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';
import 'package:portfolio/desktop/dfirst_screen.dart';
import 'package:portfolio/desktop/dfourth_screen.dart';
import 'package:portfolio/desktop/dthird_screen.dart';
import 'package:portfolio/desktop/dsecond_screen.dart';

class DesktopScreen extends StatefulWidget {
  const DesktopScreen({super.key});

  @override
  State<DesktopScreen> createState() => _DesktopScreenState();
}

class _DesktopScreenState extends State<DesktopScreen> {
  @override
  Widget build(BuildContext context) {
    desktopScaleFactor = w! / 1000;
    if (w! > 1500) {
      desktopScaleFactor = 1;
    }
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
        child: Container(
          child: Column(children: [
            //Intro and Picture
            FirstScreen(),
            //About me
            SecondScreen(),
            //Recent Projects
            ThirdScreen(),
            // Tech Stack and Contact
            FourthScreen(),
          ]),
        ),
      ),
    );
  }
}
