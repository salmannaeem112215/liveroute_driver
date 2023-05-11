import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../services/message_services.dart';

import '../../../controllers/custom_menu_controller.dart';
import '../../../models/message/chat_collection.dart';
import '../../../responsive.dart';
import '../../../configs/themes/ui_parameters.dart';
import '../../../services/message_data.dart';
import '../../../widgets/future_list.dart';
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
    final userId = u1.userId;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTitle(
          title: 'Message',
          height: Responsive.screenWidth(context) - 2 * defaultPadding,
          seeAll: () => Get.find<CustomMenuController>().selectedItem.value =
              MenuItems.message,
        ),
        SizedBox(
          height: height,
          child: FutureList(
              scrollDirection: Axis.horizontal,
              listTile: (chat) =>
                  ChatCircleTile(image: ChatCollection.getImage(chat, userId)),
              seprateBuilder: (ctx, index) => kHalfWidthSpace,
              getValues: MessageServices.getUserChats(userId)),
        ),
      ],
    );
  }
}
