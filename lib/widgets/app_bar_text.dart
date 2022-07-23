import 'package:flutter/material.dart';

class AppBarText extends StatelessWidget {
  final String text;

  const AppBarText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style:
              TextStyle(color: Theme.of(context).textTheme.titleLarge?.color),
        ),
      ],
    );
  }
}
