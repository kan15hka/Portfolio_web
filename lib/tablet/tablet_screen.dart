import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';
import 'package:portfolio/tablet/tfirst_screen.dart';
import 'package:portfolio/tablet/tfourth_screen.dart';
import 'package:portfolio/tablet/tsecond_screen.dart';
import 'package:portfolio/tablet/tthird_screen.dart';

class TabletScreen extends StatefulWidget {
  const TabletScreen({super.key});

  @override
  State<TabletScreen> createState() => _TabletScreenState();
}

class _TabletScreenState extends State<TabletScreen> {
  @override
  Widget build(BuildContext context) {
    tabletScaleFactor = w! / 750;
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
