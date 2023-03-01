import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_flutter/provider/theme_provider.dart';
import 'package:portfolio_flutter/utils/dimensions.dart';

class EducationCard extends StatelessWidget {
  const EducationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Dimensions dimensions = Dimensions(context: context);
    return Container(
      width: dimensions.width! - 2 * dimensions.height20!,
      /*padding: EdgeInsets.all(dimensions.height20),*/
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(dimensions.height20!),
        /*boxShadow: [
            BoxShadow(
                color: const Color(0xFFe8e8e8),
                blurRadius: Dimensions.height10 / 2,
                offset: Offset(0, Dimensions.height10 / 2)),
            BoxShadow(
                color: const Color(0xFFe8e8e8),
                blurRadius: Dimensions.height10 / 2,
                offset: Offset(Dimensions.height10 / 2, 0)),
            BoxShadow(
                color: const Color(0xFFe8e8e8),
                blurRadius: Dimensions.height10 / 2,
                offset: Offset(0, -Dimensions.height10 / 2)),
            BoxShadow(
                color: const Color(0xFFe8e8e8),
                blurRadius: Dimensions.height10 / 2,
                offset: Offset(-Dimensions.height10 / 2, 0)),

          ]*/
      ),
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
    Dimensions dimensions = Dimensions(context: context);

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
                  SizedBox(
                    width: dimensions.width10,
                  ),
                  Text(date,
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Theme.of(context).textTheme.bodyLarge?.color))
                ],
              ),
              SizedBox(
                height: dimensions.height10,
              ),
              Text(direction,
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context).textTheme.bodyLarge?.color)),
              SizedBox(
                height: dimensions.height10,
              ),
              Text(educationalInstitution,
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context).textTheme.bodyLarge?.color)),
              SizedBox(
                height: dimensions.height10,
              )
            ],
          ),
        )
      ],
    );
  }
}
