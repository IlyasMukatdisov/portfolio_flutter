// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:portfolio_flutter/widgets/skill_item.dart';

class SkillsSection extends StatelessWidget {
  final Color accent;

  const SkillsSection({
    Key? key,
    required this.accent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SkillItem(
          skillName: "Flutter",
          skillPercent: 0.25,
          columnCount: 2,
          accent: accent,
        ),
        SkillItem(
          skillName: "Dart",
          skillPercent: 0.75,
          columnCount: 2,
          accent: accent,
        ),
        SkillItem(
          skillName: "Kotlin",
          skillPercent: 0.8,
          columnCount: 2,
          accent: accent,
        ),
        SkillItem(
          skillName: "Jetpack Compose",
          skillPercent: 0.2,
          columnCount: 2,
          accent: accent,
        ),
      ],
    );
  }
}
