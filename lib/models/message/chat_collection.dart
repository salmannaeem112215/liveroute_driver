import 'package:mongo_dart/mongo_dart.dart' as mongo;

import '../../services/message_data.dart';
import 'chat_collection_type.dart';
import 'chat_member.dart';
import 'last_message.dart';

class ChatCollection {
  mongo.ObjectId id;
  ChatCollectionType type;
  String? name;
  String? image;
  List<ChatMember> members;
  LastMessage? lastMessage;
  int unreadCount;

  static String getImage(Map<String, dynamic> chat, mongo.ObjectId userId) {
    final isGroup =
        stringToChatCollectionType(chat['type']) == ChatCollectionType.group;

    String? image = '';
    if (isGroup) {
      image = chat['image'];
    } else {
      final members = chat['members'] as List<Map<String, dynamic>>;
      for (int i = 0; i < members.length; i++) {
        if (members[i]['user_id'] != userId) {
          image = members[i]['image'] as String?;
        }
      }
    }
    return image ?? '';
  }

  ChatCollection({
    required this.id,
    required this.type,
    this.name,
    this.image,
    required this.members,
    this.lastMessage,
    required this.unreadCount,
  });

  ChatCollection.fromJson(Map<String, dynamic> json)
      : id = json["_id"],
        type = stringToChatCollectionType(json["type"]),
        image = json['image'],
        name = json["name"],
        members = List<ChatMember>.from(
            json["members"].map((m) => ChatMember.fromJson(m))),
        lastMessage = json["last_message"] != null
            ? LastMessage.fromJson(json["last_message"])
            : null,
        unreadCount = json["unread_count"];

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "type": chatCollectionTypeToString(type),
      "name": name,
      "members": members.map((m) => m.toJson()).toList(),
      "last_message": lastMessage != null ? lastMessage!.toJson() : null,
      "unread_count": unreadCount,
      "image": image,
    };
  }

  String? get chatImage {
    if (type == ChatCollectionType.group) {
      return image;
    } else {
      for (int i = 0; i < members.length; i++) {
        if (members[i].userId != u1.userId) {
          return members[i].image;
        }
      }
      return null;
    }
  }

  String? get chatName {
    if (type == ChatCollectionType.group) {
      return name;
    } else {
      for (int i = 0; i < members.length; i++) {
        if (members[i].userId != u1.userId) {
          return members[i].name;
        }
      }
      return null;
    }
  }

  String? get chatContent {
    if (lastMessage == null) return null;
    if (lastMessage!.senderId == u1.userId) {
      return 'You: ${lastMessage!.content}';
    } else {
      if (type != ChatCollectionType.group) {
        return lastMessage!.content;
      } else {
        return lastMessage!.content;
      }
    }
  }

  int? get chatUnreadCount {
    if (lastMessage == null) return null;

    if (lastMessage!.senderId == u1.userId) {
      return null;
    } else {
      return unreadCount;
    }
  }

  DateTime? get chatTimestamp {
    if (lastMessage == null) return null;
    return lastMessage!.timestamp;
  }
}
