import 'package:flutter/material.dart';

import '../../../configs/themes/custom_text_styles.dart';
import '../../../configs/themes/ui_parameters.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    super.key,
    required this.height,
    required this.title,
    this.seeAll,
  });
  final double height;
  final String title;
  final Function()? seeAll;
  @override
  Widget build(BuildContext context) {
    if (seeAll == null || height < 100) {
      return Text(
        title,
        style: kTitleTextStyle,
      );
    } else {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: kTitleTextStyle,
            ),
            kWidthSpace,
            TextButton(onPressed: seeAll, child: const Text('see all')),
          ],
        ),
      );
    }
  }
}
