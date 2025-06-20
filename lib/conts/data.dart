import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:awesome_protfolio/model/app_model.dart';
import 'package:awesome_protfolio/model/certificate.dart';
import 'package:awesome_protfolio/model/color_model.dart';
import 'package:awesome_protfolio/model/device_model.dart';
import 'package:awesome_protfolio/model/experience_model.dart';
import 'package:awesome_protfolio/model/skill.dart';
import 'package:awesome_protfolio/screens/mini_project/about/about.dart';
import 'package:awesome_protfolio/screens/mini_project/education/education.dart';
import 'package:awesome_protfolio/screens/mini_project/skills/skills.dart';
import 'package:awesome_protfolio/screens/mini_project/cerificate/certificate.dart';
import 'package:awesome_protfolio/screens/mini_project/experience/experience.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<DeviceModel> devices = [
  DeviceModel(device: Devices.android.onePlus8Pro, data: Icons.android),
  DeviceModel(device: Devices.ios.iPhone13, data: Icons.apple),
  DeviceModel(device: Devices.ios.iPad, data: Icons.tab_rounded),
];

List<ColorModel> colorpalate = [
  ColorModel(
    svgpath: "assets/images/Cloudyred.svg",
    gradient: LinearGradient(
      colors: [Colors.yellowAccent, Colors.deepOrange],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
    ),
    color: Colors.yellow,
  ),
  ColorModel(
    svgpath: "assets/images/Cloudyblue.svg",
    color: Colors.blue,
    gradient: const LinearGradient(
      begin: Alignment.topLeft,
      colors: [Colors.blue, Colors.black45],
    ),
  ),
  ColorModel(
    svgpath: "assets/images/Cloudycyan.svg",
    color: const Color(0xff00d6ca),
    gradient: const LinearGradient(
      colors: [Color(0xff00ebd5), Color(0xff293474)],
      stops: [0, 1],
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
    ),
  ),
  ColorModel(
    svgpath: "assets/images/Cloudyblueish.svg",
    color: const Color(0xff123cd1),
    gradient: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment(-0.31, 0.95),
      colors: [Color(0xFF1042F4), Color(0x00203EA6)],
    ),
  ),
  ColorModel(
    svgpath: "assets/images/Cloudypurple.svg",
    color: Colors.purple,
    gradient: const LinearGradient(
      colors: [Color(0xffc95edb), Colors.black12],
      stops: [0, 1],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  ),
  ColorModel(
    svgpath: "assets/images/Cloudyorange.svg",
    color: const Color(0xfff35a32),
    gradient: const LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: [Colors.indigo, Colors.deepOrange], // Adjust colors as needed
    ),
  ),
];

List<AppModel> apps = [
  AppModel(
    title: "About Me",
    color: Colors.white,
    icon: FontAwesomeIcons.user,
    screen: const AboutME(),
  ),
  AppModel(
    title: "Skills",
    color: Colors.white,
    icon: FontAwesomeIcons.lightbulb,
    screen: Skills(),
  ),
  AppModel(
    title: "Education",
    color: Colors.white,
    icon: FontAwesomeIcons.graduationCap,
    screen: Education(),
  ),
  AppModel(
    title: "Experience",
    color: Colors.white,
    icon: FontAwesomeIcons.briefcase,
    screen: Experience(),
  ),
  AppModel(
    title: "Certificate",
    color: Colors.white,
    icon: FontAwesomeIcons.certificate,
    screen: CertificatePage(),
  ),
  AppModel(
    title: "LinkedIn",
    color: Colors.white,
    icon: FontAwesomeIcons.linkedin,
    link: linkedIn,
  ),
  AppModel(
    title: "Github",
    color: Colors.white,
    icon: FontAwesomeIcons.github,
    link: github,
  ),
  AppModel(
    title: "Resume",
    color: Colors.white,
    icon: FontAwesomeIcons.fileAlt,
    link: resumeLink,
  ),
  AppModel(
    title: "Twitter",
    color: Colors.white,
    icon: FontAwesomeIcons.twitter,
    link: twitter,
  ),
];

const String linkedIn = "https://www.linkedin.com/in/sahil-sardhara/";
const String github = "https://github.com/Sahil-sardhara";
const String twitter = "https://x.com/SahilSardhara2";

const String resumeLink =
    "https://drive.google.com/file/d/1Uq_kDTDVknTuRetO6GFthC2wEolQjMzn/view?usp=drive_link";
const String email = "sardharasahil47@gmail.com";
String introduction =
    "Welcome to my Portfolio website, A passionate Flutter developer with a strong foundation in Dart and cross-platform mobile app development. I specialize in creating beautiful, high-performance applications for both Android and iOS using a single codebase.";

const String playApps =
    "https://play.google.com/store/apps/developer?id=AppyMonk";

List<SkillsModel> skills = [
  SkillsModel(skillName: "Flutter", colorS: Colors.blue, iconPath: "random"),
  SkillsModel(skillName: "Firebase", colorS: Colors.yellowAccent.shade400),
  SkillsModel(skillName: "Github", colorS: Colors.black),
  SkillsModel(skillName: "Dart", colorS: Colors.blue),
  SkillsModel(skillName: "Android Development", colorS: Colors.blue),
  SkillsModel(skillName: "Web Development", colorS: Colors.blue),
  SkillsModel(skillName: "React.JS", colorS: Colors.blue),
  SkillsModel(skillName: "Figma", colorS: Colors.orange.shade800),
  SkillsModel(skillName: "REST API", colorS: Colors.black),
];

List<SkillsModel> languages = [
  SkillsModel(skillName: "Gujarati", colorS: Colors.black),
  SkillsModel(skillName: "Hindi", colorS: Colors.black),
  SkillsModel(skillName: "English", colorS: Colors.black),
];

final List<JobExperience> education = [
  JobExperience(
    color: Colors.blue,
    location: "Gujarat, India",
    title: 'Computer Science and Engineering',
    company: 'Indus University Ahmedabad',
    startDate: 'Aug 2022',
    endDate: 'May 2025',
    bulletPoints: [
      "I have completed my Bachelor's degree in Computer Science and Engineering from Indus University, Ahmedabad. Throughout the program, I developed a strong foundation in core areas such as software development, data structures, algorithms, computer systems, and operating systems. My academic journey included subjects like Object-Oriented Programming, Database Management Systems, Web and Mobile Application Development, and more. During my studies, I worked on multiple projects that helped me gain practical experience in modern tools and technologies, including Flutter and Firebase, and honed my problem-solving and analytical skills.",
    ],
  ),
  JobExperience(
    color: Colors.blue,
    location: "Gujarat, India",
    title: 'Diploma in Computer Science Engineering',
    company: 'Dailia Institue of Diploma studies',
    startDate: 'Oct 2019',
    endDate: 'June 2022',
    bulletPoints: [
      'Successfully completed a 3-year diploma in Computer Engineering, gaining foundational knowledge in software development, computer hardware, networking, and database systems.During my diploma, I also participated in technical workshops and hands-on projects that enhanced my problem-solving and coding skills, laying a strong base for my continued studies in Computer Science Engineering.',
    ],
  ),
];

final List<JobExperience> jobExperiences = [
  JobExperience(
    color: Colors.blue,
    location: "Ahmedabad, India",
    title: 'Android Developer',
    company: 'CodeCrew Infotech Pvt Ltd.',
    startDate: 'Dec 2021',
    endDate: 'May 2022',
    bulletPoints: [
      "Led the development of the Money Manager app, a personal finance tool.",
      "Implemented features for expense tracking, budget setting, and spending visualization using interactive charts.",
      "Enhanced mobile app development skills through real-world project execution.",
      "Gained hands-on experience with:"
          "- API integration"
          ",Firebase services (e.g., authentication, Firestore, real-time updates)"
          ", Version control using Git"
          ", UI/UX design principles",
      "Enhanced mobile app development skills through real-world project execution.",
    ],
  ),
  // Add more job experiences here...
  JobExperience(
    color: Colors.blue,
    location: "Remote",
    title: 'React Developer',
    company: 'Ekaantik Software Solutions',
    startDate: 'Jul 2024',
    endDate: 'June 2024',
    bulletPoints: [
      "Completed a 4-week internship focused on front-end web development using React.js.",
      "Built responsive and component-based UIs, ensuring a smooth user experience across devices.",
      "Gained practical knowledge of state management using React Hooks.",
      "Developed a Meetup Clone web application that allows users to:"
          "- Create events"
          ", Browse available events"
          ", Join events",
    ],
  ),
];

final List<Certificate> certificates = [
  Certificate(
    title: 'Complete Python Bootcamp',
    issuer: 'Udemy',
    date: 'Nov 2022',
    description:
        "Completed 60+ hours,Completed Udemy Python Bootcamp : Zero to Hero covering core Python concepts OOP and real-world project development",
    link:
        'https://drive.google.com/file/d/1N-OJzr3WbZ3d6lo13X5tjkdVxmBSC2GN/view?usp=drive_link',
  ),
  Certificate(
    title: 'AWS Academy Machine Learning',
    issuer: 'AWS academy',
    date: 'Sep 2024',
    description:
        'Completed 20 hours,Completed AWS Academy Machine Learning Foundations course, gaining essential knowledge in ML concepts, algorithms, and AWS services.',
    link:
        'https://drive.google.com/file/d/1Q7CQssWVroO7tBRrWT9RYe2o5aHr1rs3/view?usp=drive_link',
  ),
  Certificate(
    title: 'Android Development',
    issuer: 'CodeCrew Infotech PVT LTD',
    date: 'May 2022',
    description:
        'Completed 20 hours,Completed AWS Academy Machine Learning Foundations course, gaining essential knowledge in ML concepts, algorithms, and AWS services.',
    link:
        'https://drive.google.com/file/d/1_ZI9PuBNgmVsUsQLoZeQcYEhrZ2adkjH/view?usp=drive_link',
  ),
  Certificate(
    title: 'React.JS Intern',
    issuer: 'Ekaantik Software Solutions',
    date: 'July 2024',
    description:
        'Completed an internship as a React.js Developer, where I built responsive user interfaces, managed application state using hooks, and contributed to developing scalable front-end components.',
    link:
        'https://drive.google.com/file/d/12px43cYWi4nBOdX7uJy3aWzHQEPYZPkw/view?usp=drive_link',
  ),
];
