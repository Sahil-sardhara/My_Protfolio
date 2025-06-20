import 'package:awesome_protfolio/screens/phone_screen.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CurrentState extends ChangeNotifier {
  DeviceInfo currentdevice = Devices.ios.iPhone13;

  int knobselected = 2;

  bool isMainscreen = true;

  String? title;

  void changeSelectedDevice(DeviceInfo devices) {
    currentdevice = devices;
    notifyListeners();
  }

  void changegradient(int index) {
    knobselected = index;
    notifyListeners();
  }

  Widget currentscreen = PhoneScreen();

  Future<void> launcher(String link) async {
    Uri url = Uri.parse(link);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      print('Something Went Wrong');
    }
  }

  void ChnagePhoneScreen(Widget change, bool isMain, {String? titlel}) {
    currentscreen = change;
    isMainscreen = isMain;
    title = titlel;

    notifyListeners();
  }
}
