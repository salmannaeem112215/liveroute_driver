import 'package:flutter/material.dart';

class ChatCircleTile extends StatelessWidget {
  const ChatCircleTile({
    super.key,
    required this.image,
    this.height = 60,
  });
  final String image;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: height,
          width: height,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(height / 2),
          ),
          child: Image.asset(image),
        ),
        Container(
          height: height,
          width: height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(height / 2),
              border: Border.all(color: Colors.black, width: 2)),
        ),
      ],
    );
  }
}
