import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_flutter/provider/theme_provider.dart';

class SkillItem extends ConsumerWidget {
  final String skillName;
  final double skillPercent;
  final int columnCount;
  final Color accent;

  const SkillItem({
    Key? key,
    required this.skillName,
    required this.skillPercent,
    required this.columnCount,
    required this.accent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              skillName,
              style: TextStyle(
                  fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).textTheme.titleLarge?.color),
            ),
            Text("${skillPercent * 100}%",
                style: TextStyle(
                    fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                    fontWeight: FontWeight.normal,
                    color: Theme.of(context).textTheme.bodyLarge?.color)),
          ],
        ),

        Text(
          ' ',
          style: TextStyle(
            fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            minHeight: 8,
            color: accent,
            value: skillPercent,
          ),
        ),
        // Container(
        //   width: width,
        //   height: 8,
        //   decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(20),
        //       color: isDarkMode
        //           ? Colors.white.withOpacity(0.5)
        //           : Colors.black.withOpacity(0.2)),
        //   child: Row(
        //     children: [
        //       Container(
        //         height: 8,
        //         width: width * skillPercent,
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(20),
        //           color: accent,
        //         ),
        //       ),
        //       Expanded(child: Container()),
        //     ],
        //   ),
        // )
      ],
    );
  }
}
