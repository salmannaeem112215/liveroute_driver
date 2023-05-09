import 'package:flutter/material.dart';

import '../../configs/themes/ui_parameters.dart';
import '../../widgets/header.dart';
import './components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: defaultEdgePadding,
        child: Column(
          children: const [
            Header(title: 'Home'),
            kHeightSpace,
            Body(),
          ],
        ),
      ),
    );
  }
}
