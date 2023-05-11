import 'package:flutter/material.dart';
import 'package:liveroute_driver/screens/home/components/chat_tile.dart';
import 'package:liveroute_driver/widgets/header.dart';

import '../../../configs/themes/ui_parameters.dart';
import '../../../models/message/chat_collection.dart';
import '../../../responsive.dart';
import '../../../services/message_data.dart';
import '../../../services/message_services.dart';
import '../../../widgets/future_list.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final userId = u1.userId;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Header(title: 'Message'),
        Flexible(
          child: FutureList(
              listTile: (chat) => ChatTile(
                    color: Colors.transparent,
                    chatCollection: ChatCollection.fromJson(chat),
                    // width: width,
                  ),
              getValues: MessageServices.getUserChats(userId)),
        ),
      ],
    );
  }
}
