import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:liveroute_driver/configs/themes/custom_text_styles.dart';
import 'package:liveroute_driver/controllers/custom_menu_controller.dart';
import '../../../configs/themes/app_color.dart';
import '../../../functions/time.dart';
import '../../../models/message/chat_collection.dart';
import '../../../screens/home/components/chat_circle_tile.dart';
import '../../../configs/themes/ui_parameters.dart';

import 'package:mongo_dart/mongo_dart.dart' as mongo;

class ChatTile extends StatefulWidget {
  const ChatTile({
    super.key,
    required this.chatCollection,
    this.color = logoBlack,
    this.imageHeight = 60,
    this.width = 300,
  });

  final ChatCollection chatCollection;
  final Color color;
  final double imageHeight;
  final double width;
  @override
  State<ChatTile> createState() => _ChatTileState();
}

class _ChatTileState extends State<ChatTile> {
  bool isLoading = false;
  String image = '';
  String name = '';
  int? unreadCount;
  DateTime? timestamp;
  String? content;

  @override
  void initState() {
    image = widget.chatCollection.chatImage ?? '';
    name = widget.chatCollection.chatName ?? '';
    unreadCount = widget.chatCollection.chatUnreadCount;
    timestamp = widget.chatCollection.chatTimestamp;
    content = widget.chatCollection.chatContent;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(defaultPadding)),
      color: isLoading ? widget.color.withOpacity(0.7) : widget.color,
      child: InkWell(
        onTap: tapFunction,
        hoverColor: Colors.black12,
        customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defaultPadding)),
        child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding / 2, vertical: defaultPadding / 2),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ChatCircleTile(
                image: image,
                height: widget.imageHeight,
              ),
              kWidthSpace,
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            name.capitalize ?? '',
                            overflow: TextOverflow.ellipsis,
                            style: kChatNameTitle,
                          ),
                        ),
                        if (timestamp != null)
                          Text(
                            formatTime(timestamp!.hour, timestamp!.minute),
                          ),
                      ],
                    ),
                    kHalfHeightpace,
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            content ?? '',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        kWidthSpace,
                        NotificationCircle(num: unreadCount ?? -1),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          // ),
          // ),
        ),
      ),
    );
  }

  void tapFunction() async {
    setState(() {
      isLoading = true;
    });

    Get.find<CustomMenuController>().selectedItem.value = MenuItems.profhile;

    setState(() {
      isLoading = false;
    });
  }
}

class NotificationCircle extends StatelessWidget {
  const NotificationCircle({
    super.key,
    required this.num,
  });
  final int num;
  @override
  Widget build(BuildContext context) {
    if (num < 0) return const SizedBox.shrink();
    int digit = num < 100 ? num : 99;
    return Container(
      decoration: const BoxDecoration(
        color: logoBlack,
        shape: BoxShape.circle,
      ),
      width: 20,
      height: 20,
      child: Center(
        child: Text(
          digit.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 10,
          ),
        ),
      ),
    );
  }
}
