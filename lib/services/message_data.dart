import 'package:mongo_dart/mongo_dart.dart' as mongo;

import '../models/message/chat_collection.dart';
import '../models/message/chat_collection_type.dart';
import '../models/message/chat_member.dart';

final users = [u1, u2, u3, u4, u5, u6, u7, u8, u9, u10, u11, u12, u13];
final chatCollections = [
  c1,
  c2,
  c3,
  c4,
  c5,
  c6,
  c7,
  c8,
  c9,
  c10,
  c11,
  c12,
  c13,
  c14,
  c15,
  c16
];

final u1 = ChatMember(
    userId: mongo.ObjectId(),
    email: 'u1@gmail.com',
    image:
        "https://raw.githubusercontent.com/salmannaeem112215/images/main/profhile/square/pic1.jpg");
final u2 = ChatMember(
    userId: mongo.ObjectId(),
    email: 'u2@gmail.com',
    image:
        "https://raw.githubusercontent.com/salmannaeem112215/images/main/profhile/square/pic2.jpg");
final u3 = ChatMember(
    userId: mongo.ObjectId(),
    email: 'u3@gmail.com',
    image:
        "https://raw.githubusercontent.com/salmannaeem112215/images/main/profhile/square/pic3.jpg");
final u4 = ChatMember(
    userId: mongo.ObjectId(),
    email: 'u4@gmail.com',
    image:
        "https://raw.githubusercontent.com/salmannaeem112215/images/main/profhile/square/pic4.jpg");
final u5 = ChatMember(
    userId: mongo.ObjectId(),
    email: 'u5@gmail.com',
    image:
        "https://raw.githubusercontent.com/salmannaeem112215/images/main/profhile/square/pic5.jpg");
final u6 = ChatMember(
    userId: mongo.ObjectId(),
    email: 'u6@gmail.com',
    image:
        "https://raw.githubusercontent.com/salmannaeem112215/images/main/profhile/square/pic6.jpg");
final u7 = ChatMember(
    userId: mongo.ObjectId(),
    email: 'u7@gmail.com',
    image:
        "https://raw.githubusercontent.com/salmannaeem112215/images/main/profhile/square/pic7.jpg");
final u8 = ChatMember(
    userId: mongo.ObjectId(),
    email: 'u8@gmail.com',
    image:
        "https://raw.githubusercontent.com/salmannaeem112215/images/main/profhile/square/pic8.jpg");
final u9 = ChatMember(
    userId: mongo.ObjectId(),
    email: 'u9@gmail.com',
    image:
        "https://raw.githubusercontent.com/salmannaeem112215/images/main/profhile/square/pic9.jpg");
final u10 = ChatMember(
    userId: mongo.ObjectId(),
    email: 'u10@gmail.com',
    image:
        "https://raw.githubusercontent.com/salmannaeem112215/images/main/profhile/square/pic10.jpg");
final u11 = ChatMember(
    userId: mongo.ObjectId(),
    email: 'u11@gmail.com',
    image:
        "https://raw.githubusercontent.com/salmannaeem112215/images/main/profhile/square/pic11.jpg");
final u12 = ChatMember(
    userId: mongo.ObjectId(),
    email: 'u12@gmail.com',
    image:
        "https://raw.githubusercontent.com/salmannaeem112215/images/main/profhile/square/pic12.jpg");
final u13 = ChatMember(
    userId: mongo.ObjectId(),
    email: 'u13@gmail.com',
    image:
        "https://raw.githubusercontent.com/salmannaeem112215/images/main/profhile/square/pic13.jpg");

final c1 = ChatCollection(
    id: mongo.ObjectId(),
    type: ChatCollectionType.individual,
    members: [u1, u2],
    unreadCount: 1);
final c2 = ChatCollection(
    id: mongo.ObjectId(),
    type: ChatCollectionType.individual,
    members: [u1, u3],
    unreadCount: 1);
final c3 = ChatCollection(
    id: mongo.ObjectId(),
    type: ChatCollectionType.individual,
    members: [u1, u4],
    unreadCount: 1);
final c4 = ChatCollection(
    id: mongo.ObjectId(),
    type: ChatCollectionType.individual,
    members: [u1, u5],
    unreadCount: 1);
final c5 = ChatCollection(
    id: mongo.ObjectId(),
    type: ChatCollectionType.individual,
    members: [u1, u6],
    unreadCount: 1);
final c6 = ChatCollection(
    id: mongo.ObjectId(),
    type: ChatCollectionType.individual,
    members: [u1, u7],
    unreadCount: 1);
final c7 = ChatCollection(
    id: mongo.ObjectId(),
    type: ChatCollectionType.individual,
    members: [u1, u8],
    unreadCount: 1);
final c8 = ChatCollection(
    id: mongo.ObjectId(),
    type: ChatCollectionType.individual,
    members: [u1, u9],
    unreadCount: 1);
final c9 = ChatCollection(
    id: mongo.ObjectId(),
    type: ChatCollectionType.individual,
    members: [u1, u10],
    unreadCount: 1);
final c10 = ChatCollection(
    id: mongo.ObjectId(),
    type: ChatCollectionType.individual,
    members: [u1, u11],
    unreadCount: 1);
final c11 = ChatCollection(
    id: mongo.ObjectId(),
    type: ChatCollectionType.individual,
    members: [u1, u12],
    unreadCount: 1);
final c12 = ChatCollection(
    id: mongo.ObjectId(),
    type: ChatCollectionType.individual,
    members: [u1, u13],
    unreadCount: 1);
final c13 = ChatCollection(
  id: mongo.ObjectId(),
  type: ChatCollectionType.group,
  members: [u1, u2, u3, u4, u5, u6, u7, u8, u9, u10, u11, u12, u13],
  unreadCount: 1,
  image:
      "https://raw.githubusercontent.com/salmannaeem112215/images/main/profhile/square/g1.jpg",
);
final c14 = ChatCollection(
  id: mongo.ObjectId(),
  type: ChatCollectionType.group,
  members: [u1, u2, u3, u4, u5],
  unreadCount: 1,
  image:
      "https://raw.githubusercontent.com/salmannaeem112215/images/main/profhile/square/g2.jpg",
);
final c15 = ChatCollection(
  id: mongo.ObjectId(),
  type: ChatCollectionType.group,
  members: [u1, u6, u7, u8, u9],
  unreadCount: 1,
  image:
      "https://raw.githubusercontent.com/salmannaeem112215/images/main/profhile/square/g3.jpg",
);
final c16 = ChatCollection(
  id: mongo.ObjectId(),
  type: ChatCollectionType.group,
  members: [u1, u10, u11, u13],
  unreadCount: 1,
  image:
      "https://raw.githubusercontent.com/salmannaeem112215/images/main/profhile/square/g4.jpg",
);


// final m1 = Message(id: mongo.ObjectId(), senderId: u1.userId, chatId: cc1.id, timestamp: DateTime.now(), content: "Hi! my name is Salman");
// final m2 = Message(id: mongo.ObjectId(), senderId: u2.userId, chatId: cc2.id, timestamp: DateTime.now(), content: "Hi! my name is Salman");
// final m3 = Message(id: mongo.ObjectId(), senderId: u3.userId, chatId: cc3.id, timestamp: DateTime.now(), content: "Hi! my name is Salman");
// final m4 = Message(id: mongo.ObjectId(), senderId: u4.userId, chatId: cc4.id, timestamp: DateTime.now(), content: "Hi! my name is Salman");
// final m5 = Message(id: mongo.ObjectId(), senderId: u5.userId, chatId: cc5.id, timestamp: DateTime.now(), content: "Hi! my name is Salman");
// final m6 = Message(id: mongo.ObjectId(), senderId: u6.userId, chatId: cc6.id, timestamp: DateTime.now(), content: "Hi! my name is Salman");
// final m7 = Message(id: mongo.ObjectId(), senderId: u7.userId, chatId: cc7.id, timestamp: DateTime.now(), content: "Hi! my name is Salman");
// final m8 = Message(id: mongo.ObjectId(), senderId: u8.userId, chatId: cc8.id, timestamp: DateTime.now(), content: "Hi! my name is Salman");
// final m9 = Message(id: mongo.ObjectId(), senderId: u9.userId, chatId: cc9.id, timestamp: DateTime.now(), content: "Hi! my name is Salman");
// final m10 = Message(id: mongo.ObjectId(), senderId: u10.userId, chatId: cc10.id, timestamp: DateTime.now(), content: "Hi! my name is Salman");
// final m11 = Message(id: mongo.ObjectId(), senderId: u11.userId, chatId: cc11.id, timestamp: DateTime.now(), content: "Hi! my name is Salman");
// final m12 = Message(id: mongo.ObjectId(), senderId: u12.userId, chatId: cc12.id, timestamp: DateTime.now(), content: "Hi! my name is Salman");
// final m13 = Message(id: mongo.ObjectId(), senderId: u13.userId, chatId: cc13.id, timestamp: DateTime.now(), content: "Hi! my name is Salman");