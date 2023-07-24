import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hoverover/hoverover.dart';
import 'package:shimmer/shimmer.dart';
import '../constants.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          transform: GradientRotation(22 / 28),
          begin: Alignment(-0.89, 0.45),
          end: Alignment(0.89, -0.45),
          colors: [
            Color.fromARGB(255, 3, 3, 4),
            Color.fromARGB(255, 14, 11, 26),
            Color.fromARGB(255, 31, 19, 69)
          ],
        ),
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        //SHIMMER SEPARATION BAR
        Shimmer.fromColors(
          period: Duration(seconds: 10),
          baseColor: Color.fromARGB(255, 44, 38, 67),
          highlightColor: Color.fromARGB(255, 102, 109, 158),
          child: Container(height: 10.0, color: kPrimaryColor),
        ),
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              height: 150.0 * desktopScaleFactor!.toDouble(),
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
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //RECENT PROJECTS MADE BY US
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Recent\nProjects',
                      style: TextStyle(
                          color: kWhite75Color,
                          fontFamily: 'ProductSans',
                          fontSize: 25.0),
                      textScaleFactor: desktopScaleFactor,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text('-Made by us',
                        textScaleFactor: desktopScaleFactor,
                        style: TextStyle(
                            color: Color.fromARGB(191, 181, 150, 41),
                            fontFamily: 'ProductSans',
                            fontSize: 15.0)),
                  ],
                ),
                //PROJECTS
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  height: 140.0 * desktopScaleFactor!.toDouble(),
                  width: (w! > 1500) ? w! * 0.5 : w! * 0.75,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 50.0 * desktopScaleFactor!,
                        ),
                        DoubleContainer('Schoolmate',
                            'A School App for teachers and students'),
                        DoubleContainer('Quest',
                            'An Online Quiz app for teachers and students'),
                        DoubleContainer(
                            'Portfolio', 'A portfolio about myself '),
                        DoubleContainer(
                            'Chess', 'An Offline Multiplayer Chess App'),
                      ],
                    ),
                  ),
                ),
                Text(
                  ' Scroll for\nmore',
                  textAlign: TextAlign.center,
                  textScaleFactor: desktopScaleFactor,
                  style: TextStyle(
                      color: kWhite75Color,
                      fontFamily: 'ProductSans',
                      fontSize: 14.0),
                )
              ],
            )
          ],
        ),
        Container(height: 10.0, color: kPrimaryColor),
      ]),
    );
  }
}

//DOUBLE CONTAINER WIDGET
Widget DoubleContainer(String project, String projectDesc) {
  return HoverOver(
    animationDurationInMilliseconds: 200,
    translateXAxis: 5,
    translateYAxis: -10,
    builder: (isHoveredCard) {
      /// change color on hover
      final color =
          isHoveredCard ? Color.fromARGB(255, 73, 66, 96) : kPrimaryColor;
      return PhysicalModel(
          color: Color.fromARGB(0, 248, 242, 242),
          elevation: isHoveredCard ? 10 : 0,
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(5.0),
                height: 100 * desktopScaleFactor!.toDouble(),
                width: 150.0 * desktopScaleFactor!.toDouble(),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 37, 30, 63),
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: color,
                        offset: Offset(8, 8),
                      ),
                    ]),
                child: (isHoveredCard)
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            Text(
                              project,
                              textScaleFactor: desktopScaleFactor,
                              style: GoogleFonts.spaceGrotesk(
                                textStyle: TextStyle(
                                  color: kWhite75Color,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                            Text(
                              projectDesc,
                              textScaleFactor: desktopScaleFactor,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.spaceGrotesk(
                                textStyle: TextStyle(
                                  color: kWhite75Color,
                                  fontSize: 12.0,
                                ),
                              ),
                            )
                          ])
                    : Center(
                        child: Text(
                          project,
                          textScaleFactor: desktopScaleFactor,
                          style: GoogleFonts.spaceGrotesk(
                            textStyle: TextStyle(
                              color: kWhite75Color,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
              ),
              SizedBox(
                width: 50.0 * desktopScaleFactor!,
              ),
            ],
          ));
    },
  );
}
