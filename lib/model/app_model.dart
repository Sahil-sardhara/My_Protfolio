import 'package:flutter/material.dart';

class AppModel {
  final String title;
  final Color color;
  final IconData? icon;
  final Widget? screen;
  final String? link;

  AppModel({
    required this.title,
    required this.color,
    this.icon,
    this.screen,
    this.link,
  });
}
