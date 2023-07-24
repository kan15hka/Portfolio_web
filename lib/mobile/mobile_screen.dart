import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';
import 'package:portfolio/mobile/mfirst_screen.dart';
import 'package:portfolio/mobile/mfourth_screen.dart';
import 'package:portfolio/mobile/msecond_screen.dart';
import 'package:portfolio/mobile/mthird_screen.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({super.key});

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  @override
  Widget build(BuildContext context) {
    mobileWScaleFactor = w! / 400;
    mobileHScaleFactor = h! / 700;
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
