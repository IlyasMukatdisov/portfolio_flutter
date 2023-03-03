import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_flutter/provider/theme_provider.dart';

class EducationCard extends StatelessWidget {
  const EducationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: const [
            EducationCardItem(
              date: "2016-2019",
              direction: "Software Engineering Direction",
              educationalInstitution:
                  "Tashkent Professional Collage of Information Technologies",
            ),
            EducationCardItem(
              date: "2019-2022",
              direction: "Computer Engineering Direction",
              educationalInstitution:
                  "Tashkent University of Information Technologies named after Muhammad al-Khwarizmi",
            ),
          ],
        ),
      ),
    );
  }
}

class EducationCardItem extends ConsumerWidget {
  final String date;
  final String direction;
  final String educationalInstitution;

  const EducationCardItem({
    Key? key,
    required this.date,
    required this.direction,
    required this.educationalInstitution,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Color accent = ref.read(themeProvider.notifier).accent;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.calendar_month,
                    color: accent,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(date,
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Theme.of(context).textTheme.bodyLarge?.color))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(direction,
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context).textTheme.bodyLarge?.color)),
              const SizedBox(
                height: 10,
              ),
              Text(educationalInstitution,
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context).textTheme.bodyLarge?.color)),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        )
      ],
    );
  }
}
