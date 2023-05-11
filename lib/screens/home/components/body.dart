import 'package:flutter/material.dart';

import '../../../configs/themes/ui_parameters.dart';
import './message_section.dart';
import './routes_section.dart';
import './tracking_section.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        MessageSection(height: 60),
        TrackingSection(height: 250),
        // kHeightSpace,
        RouteSection(height: 400),
        kHeightSpace,
      ],
    );
  }
}
