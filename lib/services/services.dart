import '../models/message/chat_collection_type.dart';

class Services {
  static Future<List<Map<String, dynamic>>> getUserChats() async {
    final res = kAllRoutesSuccess;
    if (res['response'] == null || res['response'] != 'success') {
      throw Exception('Failed to fetch routes');
    } else if (res['body'] == null) {
      throw Exception('No body routes found');
    } else {
      final successBody = res['body'] as Map<String, dynamic>;

      if (successBody['routes'] == null) {
        throw Exception('No routes found');
      } else {
        final routes = List<Map<String, dynamic>>.from(successBody['routes']);
        return routes;
      }
    }
  }
}

final kAllRoutesSuccess = {
  'response': 'success',
  'body': {
    'routes': [
      {'id': '1', 'name': '5', 'type': 'M', 'driver': 'Rana', 'bus': 'LEK-007'},
      {'id': '2', 'name': '5', 'type': 'E', 'driver': 'Rana', 'bus': 'LEK-007'},
      {'id': '3', 'name': '6', 'type': 'M', 'driver': 'Rana', 'bus': 'LEK-007'},
      {
        'id': '4',
        'name': 'Rana Town',
        'type': 'E',
        'driver': 'Rana',
        'bus': 'LEK-007'
      },
    ],
  }
};

final kAllRoutesFail = {
  'response': 'fail',
  'body': {},
};

final kUserChatsSuccess = {
  'response': 'success',
  'body': {
    'chats': [
      {
        "_id": '1',
        "image": "",
        "type": chatCollectionTypeToString(ChatCollectionType.individual),
        "members": [
          {
            'user_id': '1',
            'email': 'm1@gmail.com',
          },
          {
            'user_id': '2',
            'email': 'm2@gmail.com',
          },
        ],
        "last_message": {
          "sender_id": '1',
          "timestamp": DateTime.now().toIso8601String(),
          "content": 'Hi Nice To Meet You',
        },
        "unread_count": 0,
      },
      {
        "_id": '2',
        "image": "",
        "type": chatCollectionTypeToString(ChatCollectionType.individual),
        "members": [
          {
            'user_id': '1',
            'email': 'm1@gmail.com',
          },
          {
            'user_id': '3',
            'email': 'm3@gmail.com',
          },
        ],
        "last_message": {
          "sender_id": '1',
          "timestamp": DateTime.now().toIso8601String(),
          "content": 'Hi Nice To Meet You',
        },
        "unread_count": 0,
      },
      {
        "_id": '3',
        "image": "",
        "type": chatCollectionTypeToString(ChatCollectionType.individual),
        "members": [
          {
            'user_id': '1',
            'email': 'm1@gmail.com',
          },
          {
            'user_id': '4',
            'email': 'm4@gmail.com',
          },
        ],
        "last_message": {
          "sender_id": '1',
          "timestamp": DateTime.now().toIso8601String(),
          "content": 'Hi Nice To Meet You',
        },
        "unread_count": 0,
      },
    ],
  }
};
