import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import '../constants.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  bool onCardTapped = false;
  List<bool> tappedCard = [];
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
          child: Container(
              height: 8.25 * tabletScaleFactor!, color: kPrimaryColor),
        ),
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              height: 150.0 * tabletScaleFactor!.toDouble(),
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
                      textScaleFactor: tabletScaleFactor,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text('-Made by us',
                        textScaleFactor: tabletScaleFactor,
                        style: TextStyle(
                            color: Color.fromARGB(191, 181, 150, 41),
                            fontFamily: 'ProductSans',
                            fontSize: 15.0)),
                  ],
                ),
                //PROJECTS
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    height: 140.0 * tabletScaleFactor!.toDouble(),
                    width: w! * 0.75,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: recentProjects.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                for (var project in recentProjects) {
                                  if (project['name'] !=
                                      recentProjects[index]['name']) {
                                    project['onTap'] = false;
                                  }
                                }
                                recentProjects[index]['onTap'] =
                                    !recentProjects[index]['onTap'];
                              });
                            },
                            child: DoubleContainer(
                                recentProjects[index]['name'],
                                recentProjects[index]['desc'],
                                recentProjects[index]['onTap']),
                          );
                        })),
                Text(
                  ' Scroll for\nmore',
                  textAlign: TextAlign.center,
                  textScaleFactor: tabletScaleFactor,
                  style: TextStyle(
                      color: kWhite75Color,
                      fontFamily: 'ProductSans',
                      fontSize: 14.0),
                )
              ],
            )
          ],
        ),
        //SEPARATION BAR
        Container(height: 8.25 * tabletScaleFactor!, color: kPrimaryColor),
      ]),
    );
  }
}

//DOUBLE CONTAINER WIDGET
Widget DoubleContainer(String project, String projectDesc, bool onCardTapped) {
  return Container(
    child: Row(
      children: [
        SizedBox(
          width: 25.0 * tabletScaleFactor!,
        ),
        Container(
          padding: EdgeInsets.all(5.0),
          height: 100 * tabletScaleFactor!.toDouble(),
          width: 150.0 * tabletScaleFactor!.toDouble(),
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 37, 30, 63),
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: (onCardTapped)
                      ? Color.fromARGB(255, 73, 66, 96)
                      : kPrimaryColor,
                  offset: Offset(4, 4),
                ),
              ]),
          child: (onCardTapped)
              ? Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    project,
                    textScaleFactor: tabletScaleFactor,
                    style: GoogleFonts.spaceGrotesk(
                      textStyle: TextStyle(
                        color: kWhite75Color,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  Text(
                    projectDesc,
                    textScaleFactor: tabletScaleFactor,
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
                    textScaleFactor: tabletScaleFactor,
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
          width: 25.0 * tabletScaleFactor!,
        ),
      ],
    ),
  );
}
