import 'package:flutter/material.dart';

//Colors
var kPrimaryColor = Color.fromARGB(255, 33, 31, 39);
var kSecondaryColor = Color.fromARGB(255, 44, 34, 77);
var kWhite75Color = Color.fromARGB(191, 255, 255, 255);
//height and width

double? w;
double? h;
double? desktopScaleFactor;
double? tabletScaleFactor;
double? mobileWScaleFactor;
double? mobileHScaleFactor;
//TextStyle

var kDesktopSubtitleWhite75 =
    TextStyle(color: kWhite75Color, fontFamily: 'ProductSans', fontSize: 30.0);
var kTabletSubtitleWhite75 =
    TextStyle(color: kWhite75Color, fontFamily: 'ProductSans', fontSize: 23.0);
var kMobileSubtitleWhite75 =
    TextStyle(color: kWhite75Color, fontFamily: 'ProductSans', fontSize: 23.0);
//social media urls
Uri instagramUrl =
    Uri.parse('https://instagram.com/kan15hka?igshid=ZDc4ODBmNjlmNQ==');
Uri facebookUrl = Uri.parse('https://www.facebook.com/s.kanishka.94');
Uri twitterUrl = Uri.parse('https://twitter.com/skan15hka');
Uri linkedinUrl =
    Uri.parse('https://www.linkedin.com/in/kanishka-s-763062223/');
Uri githubUrl = Uri.parse('https://github.com/kan15hka');

//tech Stack images
String c = 'assets/techstack/c.png';
String cpp = 'assets/techstack/cpp.png';
String python = 'assets/techstack/python.png';
String dart = 'assets/techstack/dart.png';
String html = 'assets/techstack/html.png';
String css = 'assets/techstack/css.png';
String js = 'assets/techstack/js.png';
String figma = 'assets/techstack/figma.png';
String flutter = 'assets/techstack/flutter.png';
String firebase = 'assets/techstack/firebase.png';
String git = 'assets/techstack/git.png';
String mysql = 'assets/techstack/mysql.png';

List<Map> techStack = [
  {'imageUrl': c, 'name': 'C', 'onTap': false},
  {'imageUrl': cpp, 'name': 'C++', 'onTap': false},
  {'imageUrl': python, 'name': 'PYTHON', 'onTap': false},
  {'imageUrl': dart, 'name': 'DART', 'onTap': false},
  {'imageUrl': html, 'name': 'HTML', 'onTap': false},
  {'imageUrl': css, 'name': 'CSS', 'onTap': false},
  {'imageUrl': js, 'name': 'JAVASCRIPT', 'onTap': false},
  {'imageUrl': mysql, 'name': 'MYSQL', 'onTap': false},
  {'imageUrl': figma, 'name': 'FIGMA', 'onTap': false},
  {'imageUrl': flutter, 'name': 'FLUTTER', 'onTap': false},
  {'imageUrl': firebase, 'name': 'FIREBASE', 'onTap': false},
  {'imageUrl': git, 'name': 'GIT', 'onTap': false}
];

List<Map> recentProjects = [
  {
    'name': 'Schoolmate',
    'desc': 'A School App for teachers and students',
    'onTap': false
  },
  {
    'name': 'Quest',
    'desc': 'An Online Quiz app for teachers and students',
    'onTap': false
  },
  {'name': 'Portfolio', 'desc': 'A portfolio about myself ', 'onTap': false},
  {'name': 'Chess', 'desc': 'An Offline Multiplayer Chess App', 'onTap': false},
];
