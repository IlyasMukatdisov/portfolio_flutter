import 'package:flutter/material.dart';
import 'package:portfolio_flutter/utils/app_colors.dart';

class ServiceCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String header;
  final String description;
  final double width;

  const ServiceCard({
    Key? key,
    required this.icon,
    required this.header,
    required this.description,
    required this.iconColor,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 200,
      decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.black50,
          ),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            icon,
            color: iconColor,
            size: 60,
          ),
          Text(
            header,
            style: TextStyle(
                fontSize: Theme.of(context).textTheme.headlineSmall?.fontSize,
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
