import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/constants.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:shimmer/shimmer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            // color: Colors.red,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //LOGO
                Shimmer.fromColors(
                  baseColor: kWhite75Color,
                  highlightColor: Color.fromARGB(255, 116, 122, 165),
                  child: Image.asset(
                    'assets/klogow.png',
                    height: 65.0,
                  ),
                ),

                //INTRO
                Text('Hello, It\'s me',
                    textScaleFactor: desktopScaleFactor,
                    style: kDesktopSubtitleWhite75),
                Text('KANISHKA',
                    textScaleFactor: desktopScaleFactor,
                    style: GoogleFonts.spaceGrotesk(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 80.0,
                          fontWeight: FontWeight.bold),
                    )),
                Row(
                  children: [
                    Text('I am a ',
                        textScaleFactor: desktopScaleFactor,
                        style: kDesktopSubtitleWhite75),
                    Container(
                      // color: Colors.blue,
                      width: 250.0 * desktopScaleFactor!,
                      child: AnimatedTextKit(
                          repeatForever: true,
                          stopPauseOnTap: true,
                          animatedTexts: [
                            TyperAnimatedText('Flutter Developer',
                                textStyle: TextStyle(
                                    color: kWhite75Color,
                                    fontFamily: 'ProductSans',
                                    fontSize: 30 * desktopScaleFactor!)),
                            TyperAnimatedText('Web Developer',
                                textStyle: TextStyle(
                                    color: kWhite75Color,
                                    fontFamily: 'ProductSans',
                                    fontSize: 30 * desktopScaleFactor!))
                          ]),
                    )
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Turning Vision Into Reality With Code And Design.',
                  textScaleFactor: desktopScaleFactor,
                  style: TextStyle(
                      color: Color.fromARGB(191, 255, 255, 255),
                      fontFamily: 'ProductSans',
                      fontSize: 17.0),
                ),
                //SOCIAL MEDIA
                Row(
                  children: [
                    SocialMedia(linkedinUrl, FontAwesomeIcons.linkedin),
                    SizedBox(
                      width: 5.0,
                    ),
                    SocialMedia(githubUrl, FontAwesomeIcons.github),
                    SizedBox(
                      width: 5.0,
                    ),
                    SocialMedia(instagramUrl, FontAwesomeIcons.instagram),
                    SizedBox(
                      width: 5.0,
                    ),
                    SocialMedia(facebookUrl, FontAwesomeIcons.facebook),
                    SizedBox(
                      width: 5.0,
                    ),
                    SocialMedia(twitterUrl, FontAwesomeIcons.twitter),
                  ],
                ),
              ],
            ),
          ),
          Container(
            child: Image.asset(
              'assets/tylerdurden.png',
              height: (w! > 1500) ? w! * (1000 / (w! * 2)) : w! * 0.5,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}

//Social Media Icons Url launcher
Future<void> _launchUrl(Uri url) async {
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}

Widget SocialMedia(Uri url, IconData socialMedia) {
  return IconButton(
      onPressed: () {
        _launchUrl(url);
      },
      icon: Icon(
        socialMedia,
        size: 30.0,
        color: kWhite75Color,
      ));
}
