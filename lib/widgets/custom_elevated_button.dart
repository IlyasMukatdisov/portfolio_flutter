// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_flutter/utils/constants.dart';

class CustomElevatedButton extends ConsumerWidget {
  final Future<void> Function() onPressed;
  final String text;

  final Color accent;

  const CustomElevatedButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.accent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double width = MediaQuery.of(context).size.width;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: accent,
        // padding: EdgeInsets.symmetric(
        //     horizontal: dimensions.width20! * 2, vertical: dimensions.width20!),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
        child: Text(
          text,
          style: TextStyle(
            fontSize: width < Constants.DESKTOP_WIDTH
                ? Theme.of(context).textTheme.titleMedium?.fontSize
                : Theme.of(context).textTheme.titleLarge?.fontSize,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
