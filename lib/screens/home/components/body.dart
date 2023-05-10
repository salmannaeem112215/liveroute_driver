import 'package:flutter/material.dart';

import '../../../configs/themes/custom_text_styles.dart';
import '../../../configs/themes/ui_parameters.dart';
import './rotue_tile.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Text(
              'Routes',
              style: kTitleTextStyle,
            ),
          ],
        ),
        kHeightSpace,
        const RouteTile(type: 'M', name: '5', driver: 'Rana', bus: 'LEK-007'),
        kHalfHeightpace,
        const RouteTile(type: 'M', name: '5', driver: 'Rana', bus: 'LEK-007'),
        kHalfHeightpace,
        const RouteTile(type: 'M', name: '5', driver: 'Rana', bus: 'LEK-007'),
      ],
    );
  }
}
