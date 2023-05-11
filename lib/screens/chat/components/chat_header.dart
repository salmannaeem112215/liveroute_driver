import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liveroute_driver/configs/themes/custom_text_styles.dart';
import 'package:liveroute_driver/controllers/custom_menu_controller.dart';
import 'package:liveroute_driver/screens/home/components/chat_circle_tile.dart';
import '../../../configs/themes/ui_parameters.dart';
import '../../../services/message_data.dart';

class ChatHeader extends StatelessWidget {
  const ChatHeader({super.key});
  static const double height = 50;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
      height: height,
      color: Colors.black26,
      child: Center(
        child: Row(
          children: [
            GestureDetector(
              child: const Icon(Icons.arrow_back_rounded),
              onTap: () {
                Get.find<CustomMenuController>().selectedItem.value =
                    MenuItems.message;
              },
            ),
            kHalfWidthSpace,
            ChatCircleTile(
              image: u2.image,
              height: height - 10,
            ),
            kHalfWidthSpace,
            Text(
              u2.name.capitalize!,
              style: kTileTitle,
            ),
            const Spacer(),
            kHalfWidthSpace,
            GestureDetector(
              child: const Icon(Icons.more_vert),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
