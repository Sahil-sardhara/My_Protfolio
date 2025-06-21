import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:awesome_protfolio/conts/data.dart';

class Skills extends StatelessWidget {
  const Skills({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isWide = width > 700;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: isWide ? 800 : double.infinity,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Skills",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.bold,
                    fontSize: isWide ? 28 : 22,
                  ),
                ),
                const SizedBox(height: 20),

                /// Skills Wrap
                Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 12,
                  runSpacing: 12,
                  children: List.generate(
                    skills.length,
                    (index) => Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xffeff0e0),
                        border: Border.all(color: skills[index].colorS),
                      ),
                      child: Text(
                        skills[index].skillName,
                        style: GoogleFonts.openSans(
                          fontSize: isWide ? 16 : 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),
                const Divider(color: Colors.grey),
                const SizedBox(height: 20),

                /// Language Header
                Text(
                  "Languages",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.bold,
                    fontSize: isWide ? 25 : 20,
                  ),
                ),
                const SizedBox(height: 16),

                /// Languages Wrap
                Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 12,
                  runSpacing: 12,
                  children: List.generate(
                    languages.length,
                    (index) => Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xffeff0e0),
                        border: Border.all(color: languages[index].colorS),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            languages[index].skillName,
                            style: GoogleFonts.inter(
                              fontSize: isWide ? 15 : 13,
                            ),
                          ),
                          const SizedBox(width: 8),
                          if (languages[index].iconPath != null)
                            const Icon(Icons.code, size: 18),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
