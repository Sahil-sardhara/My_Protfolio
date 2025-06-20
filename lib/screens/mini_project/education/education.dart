import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:awesome_protfolio/conts/data.dart';
import 'package:awesome_protfolio/model/experience_model.dart';

class Education extends StatefulWidget {
  const Education({super.key});

  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {
  int? _expandedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const Center(child: Icon(Icons.auto_stories_rounded, size: 100)),
          const SizedBox(height: 20),
          ...List.generate(education.length, (index) {
            final JobExperience experience = education[index];
            final bool isExpanded = _expandedIndex == index;

            return ExpansionTile(
              key: UniqueKey(), // 💡 Force rebuild each time
              initiallyExpanded: isExpanded,
              onExpansionChanged: (bool expanded) {
                setState(() {
                  _expandedIndex = expanded ? index : null;
                });
              },
              tilePadding: const EdgeInsets.all(20),
              childrenPadding: const EdgeInsets.all(10),
              leading: Container(
                width: 2,
                height: 100,
                color: experience.color,
              ),
              title: Text(
                experience.title,
                style: GoogleFonts.inter(fontWeight: FontWeight.bold),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  '${experience.company}\n${experience.startDate} - ${experience.endDate} | ${experience.location}',
                  style: GoogleFonts.inter(fontSize: 13, color: Colors.grey),
                ),
              ),
              children:
                  experience.bulletPoints.map((bulletPoint) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 4,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(width: 5),
                          Container(
                            width: 6,
                            height: 6,
                            margin: const EdgeInsets.only(top: 6),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              bulletPoint,
                              style: GoogleFonts.inter(fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
            );
          }),
        ],
      ),
    );
  }
}
