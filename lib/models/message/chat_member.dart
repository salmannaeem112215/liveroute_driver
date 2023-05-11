import 'package:mongo_dart/mongo_dart.dart' as mongo;

class ChatMember {
  mongo.ObjectId userId;
  String name;
  String image;
  ChatMember({
    required this.userId,
    required this.name,
    required this.image,
  });

  ChatMember.fromJson(Map<String, dynamic> json)
      : userId = json['user_id'],
        name = json['name'],
        image = json['image'];
  Map<String, dynamic> toJson() {
    return {
      "user_id": userId,
      "name": name,
      "image": image,
    };
  }
}
