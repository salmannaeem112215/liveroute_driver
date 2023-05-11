import 'package:mongo_dart/mongo_dart.dart' as mongo;

import 'message_data.dart';

class MessageServices {
  static Future<List<Map<String, dynamic>>> getUserChats(
      mongo.ObjectId userId) async {
    // await Future.delayed(const Duration(seconds: 2));

    final c = chatCollections.where((cc) {
      for (int i = 0; i < cc.members.length; i++) {
        if (cc.members[i].userId == userId) {
          return true;
        }
      }
      return false;
    });

    return c.map((e) => e.toJson()).toList();
  }
}
