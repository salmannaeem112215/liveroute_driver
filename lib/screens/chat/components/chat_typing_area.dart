import 'package:flutter/material.dart';

import '../../../configs/themes/ui_parameters.dart';
import './circle_icon_button.dart';

class ChatTypingArea extends StatefulWidget {
  const ChatTypingArea({
    super.key,
    required this.textController,
  });

  final TextEditingController textController;

  @override
  State<ChatTypingArea> createState() => _ChatTypingAreaState();
}

class _ChatTypingAreaState extends State<ChatTypingArea> {
  bool isTyping = false;

  @override
  void initState() {
    if (widget.textController.text == '') {
      isTyping = false;
    }

    super.initState();
  }

  onTextChanged(String text) {
    if (text == '') {
      if (isTyping != false) {
        setState(() {
          isTyping = false;
        });
      }
    } else {
      if (isTyping != true) {
        setState(() {
          isTyping = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
          horizontal: defaultPadding / 2, vertical: defaultPadding / 2),
      child: Row(
        children: [
          Flexible(
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.emoji_emotions),
                  Flexible(
                      child: TextField(
                    controller: widget.textController,
                    onChanged: onTextChanged,
                    // maxLines: 1,
                    minLines: 1,
                    maxLines: 3,
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: defaultPadding / 2,
                          vertical: defaultPadding / 2),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                    ),
                  )),
                  const Icon(Icons.image),
                ],
              ),
            ),
          ),
          kHalfWidthSpace,
          if (!isTyping) const CircleIconButton(Icons.mic_rounded),
          if (isTyping) const CircleIconButton(Icons.send_rounded),
        ],
      ),
    );
  }
}
