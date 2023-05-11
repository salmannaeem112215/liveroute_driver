import 'package:flutter/material.dart';

import '../../../configs/themes/custom_text_styles.dart';
import '../../../configs/themes/ui_parameters.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    super.key,
    required this.title,
    this.seeAll,
  });
  final String title;
  final Function()? seeAll;
  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
