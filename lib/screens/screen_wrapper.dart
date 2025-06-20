import 'package:awesome_protfolio/provider/current_state.dart';
import 'package:awesome_protfolio/screens/phone_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ScreenWrapper extends StatelessWidget {
  final Widget childg;
  const ScreenWrapper({super.key, required this.childg});

  @override
  Widget build(BuildContext context) {
    CurrentState instance = Provider.of<CurrentState>(context, listen: false);

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth, // ✅ ensure full width
          height: constraints.maxHeight, // ✅ ensure full height
          child: Column(
            children: [
              Consumer<CurrentState>(
                builder: (context, _, __) {
                  if (!instance.isMainscreen) {
                    return Container(
                      color: Colors.white,
                      width: double.infinity,
                      padding: const EdgeInsets.only(
                        top: 30,
                        left: 16,
                        right: 16,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            instance.title ?? "",
                            style: GoogleFonts.inter(fontSize: 24),
                          ),
                          IconButton(
                            onPressed: () {
                              instance.ChnagePhoneScreen(
                                const PhoneScreen(),
                                true,
                              );
                            },
                            icon: const Icon(Icons.close),
                          ),
                        ],
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
              Expanded(
                child: Container(
                  width: double.infinity, // ✅ Force full width
                  child: childg,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
