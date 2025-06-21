import 'dart:ui';
import 'package:awesome_protfolio/conts/data.dart';
import 'package:awesome_protfolio/provider/current_state.dart';
import 'package:awesome_protfolio/screens/screen_wrapper.dart';
import 'package:awesome_protfolio/widget/frosted_container.dart';
import 'package:custom_button_builder/custom_button_builder.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void showContactDialog(BuildContext context) {
    final emailController = TextEditingController();
    final messageController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 181, 206, 217),
          title: const Text("Let's Connect"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: "Your Email",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: messageController,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    labelText: "Your Suggestion",
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                final email = emailController.text;
                final message = messageController.text;

                if (email.isNotEmpty && message.isNotEmpty) {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Submitted! We'll get in touch."),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Please fill all fields.")),
                  );
                }
              },
              child: const Text("Submit"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    CurrentState currentState = Provider.of<CurrentState>(context, listen: false);

    return Scaffold(
      bottomNavigationBar: size.width < 600
          ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.favorite, color: Colors.red, size: 18),
                  SizedBox(width: 6),
                  Text(
                    "Built with love using Flutter",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            )
          : null,
      body: Stack(
        children: [
          Selector<CurrentState, int>(
            selector: (context, provider) => provider.knobselected,
            builder: (context, _, __) {
              return Container(
                decoration: BoxDecoration(
                  gradient: colorpalate[currentState.knobselected].gradient,
                ),
              );
            },
          ),
          Selector<CurrentState, int>(
            selector: (context, provider) => provider.knobselected,
            builder: (context, _, __) {
              return SvgPicture.asset(
                colorpalate[currentState.knobselected].svgpath,
                height: size.height,
                fit: BoxFit.cover,
              );
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // LEFT
                    Column(
                      children: [
                        Transform(
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.001)
                            ..rotateY(-0.07),
                          alignment: Alignment.center,
                          child: FrostedContainer(
                            height: 345,
                            weight: 247,
                            childg: const Center(
                              child: Text(
                                "HighCoder",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ).animate().fadeIn(
                                delay: 0.4.seconds,
                                duration: 0.7.seconds,
                              ),
                        ),
                        const SizedBox(height: 20),
                        Transform(
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.001)
                            ..rotateY(-0.07),
                          alignment: Alignment.center,
                          child: FrostedContainer(
                            height: 245,
                            weight: 247,
                            onTap: () => showContactDialog(context),
                            childg: const Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.connect_without_contact,
                                      color: Colors.white, size: 36),
                                  SizedBox(height: 10),
                                  Text(
                                    "Let's connect!",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ).animate().fadeIn(
                                delay: 0.6.seconds,
                                duration: 0.7.seconds,
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 30),

                    // MIDDLE
                    SizedBox(
                      height: size.height - 100,
                      child: Consumer<CurrentState>(
                        builder: (context, _, __) {
                          return DeviceFrame(
                            device: currentState.currentdevice,
                            orientation: Orientation.portrait,
                            isFrameVisible: true,
                            screen: AspectRatio(
                              aspectRatio:
                                  currentState.currentdevice.screenSize.width /
                                      currentState
                                          .currentdevice.screenSize.height,
                              child: ScreenWrapper(
                                childg: currentState.currentscreen,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 30),

                    // RIGHT
                    Column(
                      children: [
                        Transform(
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.001)
                            ..rotateY(0.07),
                          alignment: Alignment.center,
                          child: FrostedContainer(
                            height: 345,
                            weight: 247,
                            childg: Center(
                              child: Wrap(
                                alignment: WrapAlignment.center,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  ...List.generate(
                                    colorpalate.length,
                                    (index) => Consumer<CurrentState>(
                                      builder: (context, _, __) {
                                        return CustomButton(
                                          margin: const EdgeInsets.all(10),
                                          onPressed: () {
                                            currentState
                                                .changegradient(index);
                                          },
                                          animate: true,
                                          isThreeD: true,
                                          borderRadius: 100,
                                          pressed: currentState.knobselected ==
                                                  index
                                              ? Pressed.pressed
                                              : Pressed.notPressed,
                                          height: 52,
                                          width: 52,
                                          shadowColor: Colors.white,
                                          backgroundColor:
                                              colorpalate[index].color,
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ).animate().fadeIn(
                                delay: 0.5.seconds,
                                duration: 0.7.seconds,
                              ),
                        ),
                        const SizedBox(height: 20),
                        Transform(
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.001)
                            ..rotateY(0.07),
                          alignment: Alignment.center,
                          child: FrostedContainer(
                            height: 245,
                            weight: 247,
                            childg: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Center(
                                child: Text(
                                  "Don't run after success,\nrun after perfection.",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ).animate().fadeIn(
                                delay: 0.7.seconds,
                                duration: 0.7.seconds,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              // DEVICE SELECTOR
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ...List.generate(
                    devices.length,
                    (index) => Selector<CurrentState, DeviceInfo>(
                      selector: (context, provider) =>
                          provider.currentdevice,
                      builder: (context, _, __) {
                        return CustomButton(
                          backgroundColor: Colors.black,
                          borderRadius: 100,
                          onPressed: () {
                            currentState
                                .changeSelectedDevice(devices[index].device);
                          },
                          height: 30,
                          width: 30,
                          animate: true,
                          pressed: currentState.currentdevice ==
                                  devices[index].device
                              ? Pressed.pressed
                              : Pressed.notPressed,
                          isThreeD: true,
                          shadowColor: Colors.white,
                          child: Center(
                            child: Icon(
                              devices[index].data,
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
