import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:device_frame/device_frame.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:custom_button_builder/custom_button_builder.dart';

import 'package:awesome_protfolio/conts/data.dart';
import 'package:awesome_protfolio/provider/current_state.dart';

class PhoneScreen extends StatelessWidget {
  const PhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        color: Colors.black.withOpacity(0.6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Built with love",
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 6),
            const Icon(Icons.favorite, color: Colors.red, size: 16),
            const SizedBox(width: 6),
            const Text(
              "Using Flutter",
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 3),
            IconButton(
              onPressed: () {},
              icon: const FaIcon(FontAwesomeIcons.flutter),
            ),
          ],
        ),
      ),
      body: Consumer<CurrentState>(
        builder: (context, currentState, _) {
          return LayoutBuilder(
            builder: (context, constraints) {
              // Get screen width
              final screenWidth = constraints.maxWidth;
              // Decide how many items per row based on screen size
              int crossAxisCount;
              if (screenWidth >= 1200) {
                crossAxisCount = 5;
              } else if (screenWidth >= 800) {
                crossAxisCount = 4;
              } else if (screenWidth >= 600) {
                crossAxisCount = 3;
              } else {
                crossAxisCount = 2;
              }

              return Container(
                padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
                decoration: BoxDecoration(
                  gradient: colorpalate[currentState.knobselected].gradient,
                ),
                child: Center(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 20,
                    runSpacing: 30,
                    children: List.generate(apps.length, (index) {
                      return SizedBox(
                        width: screenWidth / crossAxisCount - 30,
                        child: Column(
                          children: [
                            CustomButton(
                              margin: const EdgeInsets.only(bottom: 8),
                              onPressed: () {
                                if (apps[index].link != null) {
                                  currentState.launcher(apps[index].link!);
                                } else if (apps[index].screen != null) {
                                  currentState.ChnagePhoneScreen(
                                    apps[index].screen!,
                                    false,
                                    titlel: apps[index].title,
                                  );
                                }
                              },
                              width: 55,
                              height: 55,
                              backgroundColor: apps[index].color,
                              borderRadius:
                                  currentState.currentdevice ==
                                          Devices.ios.iPhone13
                                      ? 8
                                      : 100,
                              child:
                                  apps[index].icon != null
                                      ? FaIcon(
                                        apps[index].icon,
                                        size: 20,
                                        color: Colors.black,
                                      )
                                      : const Icon(
                                        Icons.device_unknown,
                                        size: 20,
                                        color: Colors.black,
                                      ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              apps[index].title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
