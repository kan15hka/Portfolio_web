import 'package:focus_detector/focus_detector.dart';
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:shimmer/shimmer.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  //button hover
  bool onButtonHover = false;
  // PDF DOWNLOAD
  void downloadResume(String url) {
    html.AnchorElement anchorElement = new html.AnchorElement(href: url);
    anchorElement.download = 'Kanishka_Resume';
    anchorElement.click();
  }

  @override
  void initState() {
    super.initState();
    animate = false;
    textAppear = false;
    animateChanger(animate!);
  }

  //STACK ANIMATED CONTAINER
  BorderRadius? borderRadius;
  List<Color>? color;
  double? height;
  double? width;
  bool? animate;
  bool? textAppear;
  void animateChanger(bool a) {
    setState(() {
      if (a) {
        height = 250;
        width = 700;
        color = [
          Color.fromARGB(255, 3, 3, 4),
          Color.fromARGB(255, 14, 11, 26),
          Color.fromARGB(255, 31, 19, 69)
        ];
        borderRadius = BorderRadius.circular(40);
        Future.delayed(Duration(milliseconds: 300), () {
          setState(() {
            textAppear = true;
          });
        });
      } else {
        height = 250;
        width = 350;
        color = [
          Color.fromARGB(255, 3, 3, 4),
          Color.fromARGB(255, 14, 11, 26),
          Color.fromARGB(255, 31, 19, 69)
        ];
        borderRadius = BorderRadius.circular(300);
      }
    });
  }

  //SCREEN VISIBILITY
  bool isScreenVisible = false;
  void onResume() {
    setState(() {
      isScreenVisible = true;
      animate = true;
      animateChanger(animate!);
    });
    ;
  }

  void onPause() {
    setState(() {
      isScreenVisible = false;
      animate = false;
      animateChanger(animate!);
      textAppear = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            transform: GradientRotation(22 / 28),
            begin: Alignment(-0.89, 0.45),
            end: Alignment(0.89, -0.45),
            colors: [
              Color.fromARGB(255, 14, 7, 36),
              Color.fromARGB(255, 40, 32, 66),
            ],
          ),
        ),
        child: Column(
          children: [
            //SEPARATION BAR
            Container(height: 8.25 * tabletScaleFactor!, color: kPrimaryColor),
            //ANIMATED CONTAINER
            Container(
              height: 300 * tabletScaleFactor!,
              width: w! * 0.65,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment(0, 0),
                    child: AnimatedContainer(
                      height: height! * tabletScaleFactor!,
                      width: width!,
                      duration: Duration(milliseconds: 275),
                      padding: EdgeInsets.only(left: w! * 0.2),
                      decoration: BoxDecoration(
                          borderRadius: borderRadius,
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: color!),
                          border: Border.all(
                              color: Color.fromARGB(127, 110, 115, 156),
                              width: 1.5)),
                      child: AnimatedOpacity(
                        opacity: textAppear! ? 1 : 0,
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeOut,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            textAppear!
                                ? Container(
                                    //color: Colors.red,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'About Me',
                                          textScaleFactor: tabletScaleFactor,
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 85, 76, 119),
                                              fontFamily: 'ProductSans',
                                              fontSize: 22.0),
                                        ),
                                        Container(
                                          //color: Colors.amber,
                                          width: 250 * tabletScaleFactor!,
                                          padding: EdgeInsets.only(top: 8.0),
                                          child: AnimatedTextKit(
                                              totalRepeatCount: 1,
                                              repeatForever: false,
                                              displayFullTextOnTap: true,
                                              animatedTexts: [
                                                TyperAnimatedText(
                                                  'I am a Computer Science Student pursuing my career in College of Engineering , Guindy',
                                                  textStyle: TextStyle(
                                                      color: kWhite75Color,
                                                      fontFamily: 'ProductSans',
                                                      fontSize: 14.0 *
                                                          tabletScaleFactor!),
                                                ),
                                              ]),
                                        ),
                                        SizedBox(
                                          height: 15.0,
                                        ),
                                        SizedBox(
                                          child: ElevatedButton(
                                              onPressed: () {
                                                downloadResume(
                                                    'assets/dummy.pdf');
                                              },
                                              onHover: (onHover) {
                                                setState(() {
                                                  onButtonHover = onHover;
                                                });
                                              },
                                              style: ElevatedButton.styleFrom(
                                                padding: EdgeInsets.zero,
                                                backgroundColor: onButtonHover
                                                    ? Color.fromARGB(
                                                            255, 44, 38, 67)
                                                        .withOpacity(0.5)
                                                    : Colors.transparent,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    side: BorderSide(
                                                        color: Color.fromARGB(
                                                            127, 110, 115, 156),
                                                        width: 1)),
                                                elevation: 0.0,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Container(
                                                    // color: Colors.red,
                                                    child: Text(
                                                      'Resume',
                                                      textScaleFactor:
                                                          tabletScaleFactor,
                                                      style: TextStyle(
                                                          color: !onButtonHover
                                                              ? Colors.white
                                                                  .withOpacity(
                                                                      0.75)
                                                              : Color.fromARGB(
                                                                  255,
                                                                  102,
                                                                  109,
                                                                  158),
                                                          fontFamily:
                                                              'ProductSans',
                                                          fontSize: 12.0),
                                                    ),
                                                  ),
                                                  Container(
                                                    // color: Colors.yellow,
                                                    child: Icon(
                                                      Icons
                                                          .arrow_downward_rounded,
                                                      size: 14.0 *
                                                          tabletScaleFactor!,
                                                      color: !onButtonHover
                                                          ? Colors.white
                                                              .withOpacity(0.5)
                                                          : Color.fromARGB(255,
                                                              102, 109, 158),
                                                    ),
                                                  ),
                                                ],
                                              )),
                                        )
                                      ],
                                    ),
                                  )
                                : Container()
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0, 0),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 275),
                      padding: EdgeInsets.only(right: animate! ? w! * 0.35 : 0),
                      height: height! * tabletScaleFactor! * 1.35,
                      child: Shimmer.fromColors(
                        baseColor: Color.fromARGB(255, 44, 38, 67),
                        highlightColor: Color.fromARGB(255, 102, 109, 158),
                        child: Image(
                          image: AssetImage('assets/klogob.png'),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            FocusDetector(
                onFocusGained: onResume,
                onFocusLost: onPause,
                child: Container(
                  height: 10.0,
                )),
            Container(),
          ],
        ));
  }
}

//SKILL CIRCLE
Widget SkillCircle(String skill, bool isHoveredSkill) {
  return Container(
    width: 60.0,
    height: 60.0,
    child: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 38.0,
          width: 38.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: (isHoveredSkill)
                ? Color.fromARGB(255, 44, 38, 67)
                : Color.fromARGB(255, 121, 113, 153),
          ),
        ),
        Container(
          height: 35.0,
          width: 35.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: (isHoveredSkill)
                ? Color.fromARGB(255, 121, 113, 153)
                : Color.fromARGB(255, 44, 38, 67),
          ),
        ),
        Image.asset(
          skill,
          height: 20.0,
          width: 20.0,
        ),
      ],
    ),
  );
}
