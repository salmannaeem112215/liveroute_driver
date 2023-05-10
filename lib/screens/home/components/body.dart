import 'package:flutter/material.dart';
import 'package:liveroute_driver/configs/themes/custom_text_styles.dart';
import 'package:liveroute_driver/configs/themes/ui_parameters.dart';

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
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding, vertical: defaultPadding / 2),
          decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(defaultPadding)),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Chip(label: Text('M')),
                kWidthSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Title'),
                    Text('Driver'),
                    Text('Bus'),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
