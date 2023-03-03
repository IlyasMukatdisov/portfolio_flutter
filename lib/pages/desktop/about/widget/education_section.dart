import 'package:flutter/material.dart';
import 'package:portfolio_flutter/widgets/education_card.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Education :",
          style: TextStyle(
              fontSize: Theme.of(context).textTheme.headlineSmall?.fontSize,
              color: Theme.of(context).textTheme.titleLarge?.color,
              fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 20,
        ),
        const EducationCard(),
      ],
    );
  }
}
