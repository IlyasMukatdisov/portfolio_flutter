import 'package:flutter/material.dart';
import 'package:portfolio_flutter/utils/app_colors.dart';
import 'package:portfolio_flutter/utils/dimensions.dart';

class ServiceCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String header;
  final String description;

  const ServiceCard(
      {Key? key,
      required this.icon,
      required this.header,
      required this.description,
      required this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Dimensions dimensions = Dimensions(context: context);
    return Container(
      width: double.maxFinite,
      height: dimensions.height200,
      decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.black50,
          ),
          borderRadius: BorderRadius.circular(dimensions.height20!)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            icon,
            color: iconColor,
            size: dimensions.height30! * 2,
          ),
          Text(
            header,
            style: TextStyle(
                fontSize: dimensions.height20,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).textTheme.titleLarge?.color),
          ),
          Text(
            description,
            style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Theme.of(context).textTheme.bodyLarge?.color),
          ),
        ],
      ),
    );
  }
}
