import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:url_launcher/url_launcher.dart';
import '../constants.dart';

class FourthScreen extends StatefulWidget {
  const FourthScreen({super.key});

  @override
  State<FourthScreen> createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {
  bool isHoveredSkill = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: w!,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          // transform: GradientRotation(22 / 28),
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
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        SizedBox(
          height: 20.0,
        ),
        //TECH STACK
        Text(
          'Tech Stack',
          textScaleFactor: mobileWScaleFactor,
          style: TextStyle(
              color: kWhite75Color, fontFamily: 'ProductSans', fontSize: 25.0),
        ),
        SizedBox(
          height: 20.0,
        ),
        //TECH STACK BUILDER
        Container(
            //color: Colors.green,
            width: w! * 0.8 * (1 / mobileWScaleFactor!),
            child: Wrap(
              alignment: WrapAlignment.center,
              direction: Axis.horizontal,
              children: techStack.map((skill) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      for (var techSkill in techStack) {
                        if (techSkill['name'] != skill['name']) {
                          techSkill['onTap'] = false;
                        }
                      }
                      skill['onTap'] = !skill['onTap'];
                    });
                  },
                  child: Container(
                    child: (skill['onTap'])
                        ? Column(
                            children: [
                              SkillCircle(skill['imageUrl'], skill['onTap']),
                              Text(
                                skill['name'],
                                textScaleFactor: mobileWScaleFactor,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 106, 98, 141),
                                    fontFamily: 'ProductSans',
                                    fontSize: 13.0),
                              ),
                            ],
                          )
                        : SkillCircle(skill['imageUrl'], skill['onTap']),
                  ),
                );
              }).toList(),
            )),
        SizedBox(
          height: 150.0 * mobileWScaleFactor!,
        ),

        //CONTACT
        Text(
          'Contact',
          textScaleFactor: mobileWScaleFactor,
          style: TextStyle(
              color: kWhite75Color, fontFamily: 'ProductSans', fontSize: 25.0),
        ),
        SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/klogow.png',
              height: 25.0,
            ),
            Text(
              'kanishka2727@gmail.com',
              textScaleFactor: mobileWScaleFactor,
              style: TextStyle(
                  color: kWhite75Color,
                  fontFamily: 'ProductSans',
                  fontSize: 15.0),
            ),
          ],
        ),
        SizedBox(
          height: 10.0,
        ),
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
          height: 15.0,
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
          textScaleFactor: mobileWScaleFactor,
          style: TextStyle(
              color: kWhite75Color, fontFamily: 'ProductSans', fontSize: 18.0),
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
    width: 70.0,
    height: 70.0,
    child: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 53.0,
          width: 53.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: (isHoveredSkill)
                ? Color.fromARGB(255, 44, 38, 67)
                : Color.fromARGB(255, 121, 113, 153),
          ),
        ),
        Container(
          height: 50.0,
          width: 50.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: (isHoveredSkill)
                ? Color.fromARGB(255, 121, 113, 153)
                : Color.fromARGB(255, 44, 38, 67),
          ),
        ),
        Image.asset(
          skill,
          height: 35.0,
          width: 35.0,
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
