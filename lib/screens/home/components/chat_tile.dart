import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../../configs/themes/app_color.dart';
import '../../../functions/time.dart';
import '../../../models/message/chat_collection.dart';
import '../../../screens/home/components/chat_circle_tile.dart';
import '../../../configs/themes/ui_parameters.dart';

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
  final c = 'd';

  @override
  Widget build(BuildContext context) {
    final image = widget.chatCollection.chatImage ?? '';
    final name = widget.chatCollection.chatName ?? '';
    final unreadCount = widget.chatCollection.chatUnreadCount;
    final timestamp = widget.chatCollection.chatTimestamp;
    final content = widget.chatCollection.chatContent;

    final avaliableTileWidth = widget.width - 2 * defaultPadding;
    final double imageWidth = widget.imageHeight < 60 ? 60 : widget.imageHeight;

    final sTextWidth = avaliableTileWidth - imageWidth - defaultPadding;
    final double textWidth = sTextWidth < 100 ? 100 : sTextWidth;

    final controller = ScrollController();
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
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding, vertical: defaultPadding / 2),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            controller: controller,
            child: Scrollbar(
              controller: controller,
              child: SizedBox(
                width: widget.imageHeight + defaultPadding + textWidth,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: imageWidth,
                      child: ChatCircleTile(
                        image: image,
                        height: imageWidth,
                      ),
                    ),
                    kWidthSpace,
                    SizedBox(
                      width: textWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                name,
                                overflow: TextOverflow.ellipsis,
                              ),
                              if (timestamp != null)
                                Text(
                                  formatTime(timestamp.hour, timestamp.minute),
                                ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                content ?? '',
                                overflow: TextOverflow.ellipsis,
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
              ),
            ),
          ),
        ),
      ),
    );
  }

  void tapFunction() async {
    setState(() {
      isLoading = true;
    });

    // await widget.onTap();
    // await widget.onTap!();

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
