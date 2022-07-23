import 'package:flutter/material.dart';
import 'package:portfolio_flutter/provider/theme_provider.dart';
import 'package:portfolio_flutter/utils/app_colors.dart';
import 'package:portfolio_flutter/utils/dimensions.dart';
import 'package:provider/provider.dart';

class EducationCard extends StatelessWidget {
  const EducationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Dimensions.context = context;
    return Container(
      width: Dimensions.width - 2 * Dimensions.height20,
      /*padding: EdgeInsets.all(Dimensions.height20),*/
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(Dimensions.height20),
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

class EducationCardItem extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, provider, child) {
        Color accent = provider.accent;
        
        return Row(
          children: [
            Column(
              children: [
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      color: accent,
                      borderRadius: BorderRadius.circular(10)),
                ),
                Container(
                  width: 1,
                  height: 100,
                  decoration: BoxDecoration(
                    color: accent,
                  ),
                )
              ],
            ),
            SizedBox(
              width: Dimensions.width20,
            ),
            Expanded(
              child: SizedBox(
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_month,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: Dimensions.width10,
                        ),
                        Text(date,
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.color))
                      ],
                    ),
                    Text(direction,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color:
                                Theme.of(context).textTheme.bodyText1?.color)),
                    Text(educationalInstitution,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color:
                                Theme.of(context).textTheme.bodyText1?.color)),
                    SizedBox(
                      height: Dimensions.height10,
                    )
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
