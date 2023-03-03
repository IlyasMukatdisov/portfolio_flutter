import 'package:flutter/material.dart';
import 'package:portfolio_flutter/widgets/experience_card.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Experience :",
          style: TextStyle(
              fontSize: Theme.of(context).textTheme.headlineSmall?.fontSize,
              color: Theme.of(context).textTheme.titleLarge?.color,
              fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 20,
        ),
        const ExperienceCard(),
      ],
    );
  }
}
