import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
          child: CachedNetworkImage(
            imageUrl: image,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(
              Icons.person,
              size: height / 2,
            ),
          ),
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
