import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_flutter/provider/theme_provider.dart';

class ExperienceCard extends StatelessWidget {
  const ExperienceCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Card(
      elevation: 5,
      child: Container(
        width: width - 2 * 20,
        padding: const EdgeInsets.all(10),
        child: Column(
          children: const [
            ExperienceCardItem(
              date: "2018-2019",
              profession: "Computer Technician",
              workPlace: "«O'zelektroapparat-Electroshield» JSC",
            ),
            ExperienceCardItem(
              date: "2021",
              profession: "Computer Technician",
              workPlace: "REPUBLICAN RESEARCH CENTRE OF EMERGENCY MEDICINE",
            ),
          ],
        ),
      ),
    );
  }
}

class ExperienceCardItem extends ConsumerWidget {
  final String date;
  final String profession;
  final String workPlace;

  const ExperienceCardItem({
    Key? key,
    required this.date,
    required this.profession,
    required this.workPlace,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Color accent = ref.read(themeProvider.notifier).accent;

    return Row(
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
              Text(profession,
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context).textTheme.bodyLarge?.color)),
              const SizedBox(
                height: 10,
              ),
              Text(workPlace,
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
