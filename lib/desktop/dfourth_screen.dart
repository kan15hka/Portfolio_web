import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hoverover/hoverover.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants.dart';

class FourthScreen extends StatefulWidget {
  const FourthScreen({super.key});

  @override
  State<FourthScreen> createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: w!,
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
        SizedBox(
          height: 20.0,
        ),
        //TECH STACK
        Text(
          'Tech Stack',
          textScaleFactor: desktopScaleFactor,
          style: kDesktopSubtitleWhite75,
        ),
        SizedBox(
          height: 20.0,
        ),
        //TECH STACK BUILDER
        Container(
            width: w! * 0.5,
            child: Wrap(
              alignment: WrapAlignment.center,
              direction: Axis.horizontal,
              children: techStack.map((skill) {
                return HoverOver(
                    animationDurationInMilliseconds: 200,
                    translateYAxis: -10,
                    builder: (isHoveredSkill) {
                      return PhysicalModel(
                        color: Color.fromARGB(0, 248, 242, 242),
                        elevation: (isHoveredSkill) ? 10 : 0,
                        child: (isHoveredSkill)
                            ? Column(
                                children: [
                                  SkillCircle(
                                      skill['imageUrl'], isHoveredSkill),
                                  Text(
                                    skill['name'],
                                    textScaleFactor: desktopScaleFactor,
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 106, 98, 141),
                                        fontFamily: 'ProductSans',
                                        fontSize: 12.0),
                                  ),
                                ],
                              )
                            : SkillCircle(skill['imageUrl'], isHoveredSkill),
                      );
                    });
              }).toList(),
            )),
        SizedBox(
          height: 150.0 * desktopScaleFactor!,
        ),
        //CONTACT
        Text(
          'Contact',
          textScaleFactor: desktopScaleFactor,
          style: kDesktopSubtitleWhite75,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/klogow.png',
              height: 22.0,
            ),
            Text(
              'kanishka2727@gmail.com',
              textScaleFactor: desktopScaleFactor,
              style: TextStyle(
                  color: kWhite75Color,
                  fontFamily: 'ProductSans',
                  fontSize: 12.0),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SocialMedia(linkedinUrl, FontAwesomeIcons.linkedin),
            SocialMedia(githubUrl, FontAwesomeIcons.github),
            SocialMedia(instagramUrl, FontAwesomeIcons.instagram),
            SocialMedia(facebookUrl, FontAwesomeIcons.facebook),
            SocialMedia(twitterUrl, FontAwesomeIcons.twitter),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: w! * 0.05),
          child: Divider(
            color: Color.fromARGB(255, 106, 98, 141),
            thickness: 1.7,
          ),
        ),
        Text(
          'Made with Flutter',
          textScaleFactor: desktopScaleFactor,
          style: TextStyle(
              color: kWhite75Color, fontFamily: 'ProductSans', fontSize: 12.0),
        ),
        SizedBox(
          height: 10.0,
        ),
      ]),
    );
  }
}

//SKILL CIRCLE
Widget SkillCircle(String skill, bool isHoveredSkill) {
  return Container(
    width: 70.0 * desktopScaleFactor!,
    height: 70.0 * desktopScaleFactor!,
    child: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 53.0 * desktopScaleFactor!,
          width: 53.0 * desktopScaleFactor!,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: (isHoveredSkill)
                ? Color.fromARGB(255, 44, 38, 67)
                : Color.fromARGB(255, 121, 113, 153),
          ),
        ),
        Container(
          height: 50.0 * desktopScaleFactor!,
          width: 50.0 * desktopScaleFactor!,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: (isHoveredSkill)
                ? Color.fromARGB(255, 121, 113, 153)
                : Color.fromARGB(255, 44, 38, 67),
          ),
        ),
        Image.asset(
          skill,
          height: 30.0 * desktopScaleFactor!,
          width: 30.0 * desktopScaleFactor!,
        ),
      ],
    ),
  );
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
        size: 18.0,
        color: kWhite75Color,
      ));
}
