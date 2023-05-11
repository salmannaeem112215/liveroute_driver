import 'package:mongo_dart/mongo_dart.dart' as mongo;

class ChatMember {
  mongo.ObjectId userId;
  String email;
  String image;
  ChatMember({
    required this.userId,
    required this.email,
    required this.image,
  });

  ChatMember.fromJson(Map<String, dynamic> json)
      : userId = json['user_id'],
        email = json['email'],
        image = json['image'];
  Map<String, dynamic> toJson() {
    return {
      "user_id": userId,
      "email": email,
      "image": image,
    };
  }
}
