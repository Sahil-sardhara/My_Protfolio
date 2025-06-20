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
    return Consumer<CurrentState>(
      builder: (context, currentState, _) {
        return Container(
          padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
          decoration: BoxDecoration(
            gradient: colorpalate[currentState.knobselected].gradient,
          ),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            children: [
              ...List.generate(
                apps.length,
                (index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        right: 10,
                        left: 10,
                        top: 40,
                        bottom: 20,
                      ),
                      child: Column(
                        children: [
                          CustomButton(
                            margin: const EdgeInsets.only(bottom: 5),
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
                            width: 45,
                            height: 45,
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
                                    : Icon(
                                      Icons.device_unknown,
                                      size: 20,
                                      color: Colors.black,
                                    ),
                          ),
                          SizedBox(
                            width: 60,
                            child: Center(
                              child: Text(
                                apps[index].title,
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
