import 'package:flutter/material.dart';
import '../../../screens/home/components/chat_tile.dart';

import '../../../models/message/chat_collection.dart';
import '../../../services/message_data.dart';
import '../../../services/message_services.dart';
import '../../../widgets/future_list.dart';
import './chat_typing_area.dart';
import './chat_header.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final userId = u2.userId;
    return Column(
      children: [
        const ChatHeader(),
        Flexible(
          child: FutureList(
              listTile: (chat) => ChatTile(
                    color: Colors.transparent,
                    chatCollection: ChatCollection.fromJson(chat),
                    // width: width,
                  ),
              getValues: MessageServices.getUserChats(userId)),
        ),
        ChatTypingArea(
          textController: TextEditingController(),
        )
      ],
    );
  }
}
