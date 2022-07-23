import 'package:flutter/material.dart';
import 'package:portfolio_flutter/utils/app_colors.dart';
import 'package:portfolio_flutter/utils/dimensions.dart';

class ExperienceCard extends StatelessWidget {
  const ExperienceCard({Key? key}) : super(key: key);

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

class ExperienceCardItem extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                  color: AppColors.red,
                  borderRadius: BorderRadius.circular(10)),
            ),
            Container(
              width: 1,
              height: 100,
              decoration: BoxDecoration(
                color: AppColors.red,
              ),
            )
          ],
        ),
        SizedBox(
          width: Dimensions.width20,
        ),
        Expanded(
          child: Container(
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
                            color:
                                Theme.of(context).textTheme.bodyText1?.color))
                  ],
                ),
                Text(profession,
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Theme.of(context).textTheme.bodyText1?.color)),
                Text(workPlace,
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Theme.of(context).textTheme.bodyText1?.color)),
                SizedBox(
                  height: Dimensions.height10,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
