import 'package:flutter/material.dart';
import '../../../configs/themes/app_color.dart';
import '../../../configs/themes/custom_text_styles.dart';
import '../../../configs/themes/ui_parameters.dart';

class RouteTile extends StatelessWidget {
  const RouteTile({
    super.key,
    required this.type,
    required this.name,
    this.driver,
    required this.bus,
  });

  final String name;
  final String? driver;
  final String bus;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
          horizontal: defaultPadding, vertical: defaultPadding / 2),
      decoration: BoxDecoration(
        color: logoBlack,
        borderRadius: BorderRadius.circular(defaultPadding),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Chip(
              label: Text(
                type,
                style: kChipTextStyle,
              ),
            ),
            kWidthSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: kTileTitle,
                ),
                if (driver != null) Text(driver!, style: kTileSubTitle),
                Text(bus, style: kTileSubTitle),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
