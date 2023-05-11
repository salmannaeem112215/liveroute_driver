import 'package:flutter/material.dart';

import './components/body.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (size.height < 150 && size.width > 200) {
      return getResponsiveBody(150, size.width);
    } else if (size.height > 150 && size.width < 200) {
      return getResponsiveBody(size.height, 200);
    } else if (size.height < 150 && size.width < 200) {
      return getResponsiveBody(150, 200);
    } else {
      return const SafeArea(
        child: Body(),
      );
    }
  }

  SafeArea getResponsiveBody(double height, double width) {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            height: height,
            width: width,
            child: const Body(),
          ),
        ),
      ),
    );
  }
}
