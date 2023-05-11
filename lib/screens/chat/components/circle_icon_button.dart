import 'package:flutter/material.dart';
import '../../../configs/themes/app_color.dart';

class CircleIconButton extends StatelessWidget {
  const CircleIconButton(
    this.icon, {
    super.key,
    this.onTap,
    this.iconColor = bgColorLight,
    this.bgColor = logoBlack,
    this.iconSize = 20,
  });
  final Function()? onTap;
  final IconData icon;
  final Color iconColor;
  final Color bgColor;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
          child: Center(
            child: Icon(
              icon,
              color: iconColor,
              size: iconSize,
            ),
          )),
    );
  }
}
