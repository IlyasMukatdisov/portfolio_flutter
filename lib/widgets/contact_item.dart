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
    return Column(
      children: [
        Icon(
          icon,
          size: Dimensions.height20 * 2,
          color: iconColor,
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        Text(
          header,
          style: TextStyle(
              fontSize: Dimensions.height10 * 1.6,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).textTheme.subtitle1?.color),
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        Text(
          value,
          style: TextStyle(
              fontWeight: FontWeight.normal,
              color: Theme.of(context).textTheme.bodyText1?.color),
        ),
      ],
    );
  }
}