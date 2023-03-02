import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_flutter/provider/theme_provider.dart';

class ExperienceCard extends StatelessWidget {
  const ExperienceCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Container(
      width: width - 2 * 20,
      /*padding: EdgeInsets.all(dimensions.height20),*/
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(20),
        /*boxShadow: [
            BoxShadow(
                color: const Color(0xFFe8e8e8),
                blurRadius: dimensions.height10 / 2,
                offset: Offset(0, dimensions.height10 / 2)),
            BoxShadow(
                color: const Color(0xFFe8e8e8),
                blurRadius: dimensions.height10 / 2,
                offset: Offset(dimensions.height10 / 2, 0)),
            BoxShadow(
                color: const Color(0xFFe8e8e8),
                blurRadius: dimensions.height10 / 2,
                offset: Offset(0, -dimensions.height10 / 2)),
            BoxShadow(
                color: const Color(0xFFe8e8e8),
                blurRadius: dimensions.height10 / 2,
                offset: Offset(-dimensions.height10 / 2, 0)),

          ]*/
      ),
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
