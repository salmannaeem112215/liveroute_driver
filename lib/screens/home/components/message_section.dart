import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/custom_menu_controller.dart';
import '../../../responsive.dart';
import '../../../configs/themes/ui_parameters.dart';
import './chat_circle_tile.dart';
import './custom_title.dart';

class MessageSection extends StatelessWidget {
  const MessageSection({
    super.key,
    this.height = 60,
  });
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTitle(
          title: 'Message',
          height: Responsive.screenWidth(context) - 2 * defaultPadding,
          seeAll: () => Get.find<CustomMenuController>().selectedItem.value =
              MenuItems.message,
        ),
        kHalfHeightpace,
        SizedBox(
          height: height,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctx, index) => ChatCircleTile(
              image: 'assets/images/logo.png',
              height: height,
            ),
            separatorBuilder: (ctx, index) => kHalfWidthSpace,
            itemCount: 7,
          ),
        ),
      ],
    );
  }
}
