import 'package:flutter/material.dart';
import 'package:portfolio_flutter/utils/dimensions.dart';

class AboutPageItem extends StatelessWidget {
  final String header;
  final String value;

  const AboutPageItem({
    Key? key,
    required this.header,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    Dimensions dimensions = Dimensions(context: context);

    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(vertical: dimensions.height10!),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: isDarkMode
                      ? Colors.white.withOpacity(0.5)
                      : Colors.black.withOpacity(0.2),
                  width: 2))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(header,
              style: TextStyle(
                  fontSize: dimensions.height10! * 1.7,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).textTheme.headline5?.color)),
          Text(value,
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Theme.of(context).textTheme.bodyText1?.color)),
        ],
      ),
    );
  }
}
