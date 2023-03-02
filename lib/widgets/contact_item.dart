import 'package:flutter/material.dart';

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
          size: 40,
          color: iconColor,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          header,
          style: TextStyle(
              fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).textTheme.titleMedium?.color),
        ),
        const SizedBox(
          height: 10,
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
