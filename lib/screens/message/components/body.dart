import 'package:flutter/material.dart';
import 'package:liveroute_driver/screens/home/components/chat_tile.dart';

import '../../../configs/themes/ui_parameters.dart';
import '../../../models/message/chat_collection.dart';
import '../../../responsive.dart';
import '../../../services/message_data.dart';
import '../../../services/message_services.dart';
import '../../../widgets/future_list.dart';
import '../../home/components/chat_circle_tile.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final avaliableHeight = Responsive.avaliableHeight(context);
    final width = Responsive.avaliableWidth(context) - 2 * defaultPadding;
    final userId = u1.userId;
    return SizedBox(
      height: avaliableHeight < 100 ? 100 : avaliableHeight,
      child: FutureList(
          listTile: (chat) => ChatTile(
                color: Colors.transparent,
                chatCollection: ChatCollection.fromJson(chat),
                width: width,
              ),
          // seprateBuilder: (ctx, index) => kHalfHeightpace,
          getValues: MessageServices.getUserChats(userId)),
    );
  }
}
