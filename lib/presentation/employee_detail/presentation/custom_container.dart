import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../core/presentation/widgets/at_text.dart';

class CustomContainer extends StatelessWidget {
  final Color backgroundColor;
  final Color progressColor;
  final double progress;
  final double size;
  final Widget picture;
  final Widget name;

  const CustomContainer({
    Key? key,
    this.backgroundColor = Colors.grey,
    this.progressColor = Colors.red,
    required this.progress,
    required this.size,
    required this.picture,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: SizedBox(
        height: size,
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              color: backgroundColor,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: size * progress,
                color: progressColor,
              ),
            ),
            picture,
            name,
          ],
        ),
      ),
    );
  }
}
