import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/constants.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:shimmer/shimmer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:stroke_text/stroke_text.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          // transform: GradientRotation(22/48),
          // begin: Alignment(-0.89, 0.45),
          // end: Alignment(0.89, -0.45),
          begin: Alignment.topLeft, end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 3, 3, 4),
            Color.fromARGB(255, 14, 11, 26),
            Color.fromARGB(255, 31, 19, 69)
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                height: h! * 0.53 * mobileWScaleFactor!,
              ),
              //NAME TOP
              Positioned.fill(
                  child: Align(
                      alignment: Alignment(0.0, -0.8), child: NameText(true))),
              //NAME MIDDLE TOP
              Positioned.fill(
                  child: Align(
                      alignment: Alignment(0.0, -0.5), child: NameText(true))),
              //NAME MIDDLE

              Positioned.fill(
                  child: Align(
                      alignment: Alignment(0.0, 0.2), child: NameText(false))),
              //NAME MIDDLE BOTTOM
              Positioned.fill(
                  child: Align(
                      alignment: Alignment(0.0, 0.7), child: NameText(true))),
              //NAME BOTTOM
              Positioned.fill(
                  child: Align(
                      alignment: Alignment(0.0, 1.0), child: NameText(true))),
              Positioned.fill(
                child: Align(
                  alignment: Alignment(-0.5, 0.0),
                  child: Container(
                    // color: Colors.amber,
                    child: Image.asset(
                      'assets/tylerdurdenf.png',
                      height: h! * 0.45 * mobileWScaleFactor!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              //NAME MIDDLE
              Positioned.fill(
                  child: Align(
                      alignment: Alignment(0.0, 0.2), child: NameText(true))),
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
          //INTRO INFORMATION
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //LOGO
              Container(
                // color: Colors.amber,
                child: Shimmer.fromColors(
                  baseColor: kWhite75Color,
                  highlightColor: Color.fromARGB(255, 116, 122, 165),
                  child: Image.asset(
                    'assets/klogob.png',
                    width: w! * 0.2,
                  ),
                ),
              ),
              Container(
                // color: Colors.red,
                width: w! * 0.6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30.0,
                    ),
                    //INTRO
                    Text('Hello, It\'s me',
                        textScaleFactor: mobileWScaleFactor,
                        style: kMobileSubtitleWhite75),
                    Text('KANISHKA',
                        textScaleFactor: mobileWScaleFactor,
                        style: GoogleFonts.spaceGrotesk(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold),
                        )),
                    Row(
                      children: [
                        Text('I am a ',
                            textScaleFactor: mobileWScaleFactor,
                            style: kMobileSubtitleWhite75),
                        Container(
                          // color: Color.fromRGBO(33, 150, 243, 1),
                          width: 170.0 * mobileWScaleFactor!,
                          child: AnimatedTextKit(
                              repeatForever: true,
                              stopPauseOnTap: true,
                              animatedTexts: [
                                TyperAnimatedText('Flutter Developer',
                                    textStyle: TextStyle(
                                        color: kWhite75Color,
                                        fontFamily: 'ProductSans',
                                        fontSize: 23 * mobileWScaleFactor!)),
                                TyperAnimatedText('Web Developer',
                                    textStyle: TextStyle(
                                        color: kWhite75Color,
                                        fontFamily: 'ProductSans',
                                        fontSize: 23 * mobileWScaleFactor!))
                              ]),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Turning Vision Into Reality With Code And Design.',
                      textScaleFactor: mobileWScaleFactor,
                      style: TextStyle(
                          color: Color.fromARGB(191, 255, 255, 255),
                          fontFamily: 'ProductSans',
                          fontSize: 18.0),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    //SOCIAL MEDIA
                    Container(
                      width: w! * 0.55,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SocialMedia(linkedinUrl, FontAwesomeIcons.linkedin),
                          SocialMedia(githubUrl, FontAwesomeIcons.github),
                          SocialMedia(instagramUrl, FontAwesomeIcons.instagram),
                          SocialMedia(facebookUrl, FontAwesomeIcons.facebook),
                          SocialMedia(twitterUrl, FontAwesomeIcons.twitter),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 80.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//NAME TEXT
Widget NameText(bool outline) {
  return (outline)
      ? StrokeText(
          text: 'KANISHKA',
          strokeColor: kWhite75Color,
          textStyle: GoogleFonts.spaceGrotesk(
            textStyle: TextStyle(
                color: Colors.transparent,
                fontSize: 60.0 * mobileWScaleFactor!,
                fontWeight: FontWeight.bold),
          ))
      : Text('KANISHKA',
          style: GoogleFonts.spaceGrotesk(
            textStyle: TextStyle(
                color: Colors.white,
                fontSize: 60.0 * mobileWScaleFactor!,
                fontWeight: FontWeight.bold),
          ));
}

//SOCIALMEDIA ICONS URL LAUNCHER
Future<void> _launchUrl(Uri url) async {
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}

Widget SocialMedia(Uri url, IconData socialMedia) {
  return IconButton(
      padding: EdgeInsets.zero,
      constraints: BoxConstraints(),
      onPressed: () {
        _launchUrl(url);
      },
      icon: Icon(
        socialMedia,
        size: 30.0 * mobileWScaleFactor!,
        color: kWhite75Color,
      ));
}
