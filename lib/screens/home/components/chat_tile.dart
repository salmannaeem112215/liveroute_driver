import 'package:flutter/material.dart';
import '../../../configs/themes/app_color.dart';
import '../../../models/message/chat_collection.dart';
import '../../../screens/home/components/chat_circle_tile.dart';
import '../../../configs/themes/ui_parameters.dart';

class ChatTile extends StatefulWidget {
  const ChatTile({
    super.key,
    required this.chatCollection,
    this.color = logoBlack,
    this.imageHeight = 60,
  });

  final ChatCollection chatCollection;
  final Color color;
  final double imageHeight;

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
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ChatCircleTile(
                  image: image,
                  height: widget.imageHeight,
                ),
                kWidthSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(name),
                        if (timestamp != null) Text(timestamp.toString()),
                      ],
                    ),
                    Row(
                      children: [
                        Text(content ?? ''),
                        Text('${unreadCount ?? ''}'),
                      ],
                    ),
                  ],
                ),
              ],
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
