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
    final instance = Provider.of<CurrentState>(context, listen: false);

    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;

        return Container(
          width: screenWidth,
          height: constraints.maxHeight,
          child: Column(
            children: [
              Consumer<CurrentState>(
                builder: (context, state, _) {
                  if (!state.isMainscreen) {
                    return SafeArea(
                      child: Container(
                        color: Colors.white,
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: screenWidth < 500 ? 12 : 24,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                state.title ?? "",
                                style: GoogleFonts.inter(
                                  fontSize: screenWidth < 500 ? 20 : 24,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                state.ChnagePhoneScreen(
                                  const PhoneScreen(),
                                  true,
                                );
                              },
                              icon: const Icon(Icons.close),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
              Expanded(child: Container(width: double.infinity, child: childg)),
            ],
          ),
        );
      },
    );
  }
}
