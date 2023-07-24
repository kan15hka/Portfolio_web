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
                    height: 50.0,
                  ),
                ),

                //INTRO
                Text('Hello, It\'s me',
                    textScaleFactor: tabletScaleFactor,
                    style: kTabletSubtitleWhite75),
                Text('KANISHKA',
                    textScaleFactor: tabletScaleFactor,
                    style: GoogleFonts.spaceGrotesk(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 60.0,
                          fontWeight: FontWeight.bold),
                    )),
                Row(
                  children: [
                    Text('I am a ',
                        textScaleFactor: tabletScaleFactor,
                        style: kTabletSubtitleWhite75),
                    Container(
                      // color: Color.fromRGBO(33, 150, 243, 1),
                      width: 200.0 * tabletScaleFactor!,
                      child: AnimatedTextKit(
                          repeatForever: true,
                          stopPauseOnTap: true,
                          animatedTexts: [
                            TyperAnimatedText('Flutter Developer',
                                textStyle: TextStyle(
                                    color: kWhite75Color,
                                    fontFamily: 'ProductSans',
                                    fontSize: 23 * tabletScaleFactor!)),
                            TyperAnimatedText('Web Developer',
                                textStyle: TextStyle(
                                    color: kWhite75Color,
                                    fontFamily: 'ProductSans',
                                    fontSize: 23 * tabletScaleFactor!))
                          ]),
                    )
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Turning Vision Into Reality With Code And Design.',
                  textScaleFactor: tabletScaleFactor,
                  style: TextStyle(
                      color: Color.fromARGB(191, 255, 255, 255),
                      fontFamily: 'ProductSans',
                      fontSize: 15.0),
                ),
                //SOCIAL MEDIA
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SocialMedia(linkedinUrl, FontAwesomeIcons.linkedin),
                    SocialMedia(githubUrl, FontAwesomeIcons.github),
                    SocialMedia(instagramUrl, FontAwesomeIcons.instagram),
                    SocialMedia(facebookUrl, FontAwesomeIcons.facebook),
                    SocialMedia(twitterUrl, FontAwesomeIcons.twitter),
                  ],
                ),
              ],
            ),
          ),
          Container(
            // color: Colors.amber,
            child: Image.asset(
              'assets/tylerdurden.png',
              height: w! / 2,
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
      padding: EdgeInsets.zero,
      constraints: BoxConstraints(),
      onPressed: () {
        _launchUrl(url);
      },
      icon: Icon(
        socialMedia,
        size: 20.0 * tabletScaleFactor!,
        color: kWhite75Color,
      ));
}
