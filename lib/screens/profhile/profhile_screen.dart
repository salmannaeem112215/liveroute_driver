import 'package:flutter/material.dart';

import '../../configs/themes/ui_parameters.dart';
import '../../widgets/header.dart';
import './components/body.dart';

class ProfhileScreen extends StatelessWidget {
  const ProfhileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: defaultEdgePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Header(title: 'Profhile'),
            kHeightSpace,
            Body(),
          ],
        ),
      ),
    );
  }
}
