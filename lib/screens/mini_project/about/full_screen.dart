import 'package:flutter/material.dart';

class FullScreen extends StatelessWidget {
  const FullScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Center(
          child: InteractiveViewer(
            child: Image.asset(
              "assets/images/about_profile.jpg",
              fit: BoxFit.contain,
              width: size.width * 0.9,
              height: size.height * 0.9,
            ),
          ),
        ),
      ),
    );
  }
}
