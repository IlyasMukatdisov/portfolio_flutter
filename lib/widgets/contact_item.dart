import 'package:flutter/material.dart';
import 'package:portfolio_flutter/utils/dimensions.dart';

class ContactItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String header;
  final String value;

  const ContactItem(
      {Key? key,
      required this.icon,
      required this.iconColor,
      required this.header,
      required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Dimensions dimensions = Dimensions(context: context);

    return Column(
      children: [
        Icon(
          icon,
          size: dimensions.height20! * 2,
          color: iconColor,
        ),
        SizedBox(
          height: dimensions.height10,
        ),
        Text(
          header,
          style: TextStyle(
              fontSize: dimensions.height10! * 1.6,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).textTheme.titleMedium?.color),
        ),
        SizedBox(
          height: dimensions.height10,
        ),
        Text(
          value,
          style: TextStyle(
              fontWeight: FontWeight.normal,
              color: Theme.of(context).textTheme.bodyLarge?.color),
        ),
      ],
    );
  }
}
