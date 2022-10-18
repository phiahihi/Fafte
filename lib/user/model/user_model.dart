import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String name;
  // final String email;
  // final String uid;

  UserModel({required this.name});

  UserModel.fromJson(Map<String, dynamic> json) : name = json['name'];
  // email = json['email'],
  // uid = json['uid'];

  Map<String, dynamic> toJson() => {
        'name': name,
        // 'email': email,
        // 'uid': uid,
      };

  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;

    // you likely need to convert the date_posted field.  something like this

    return UserModel(name: data['userName'] ?? data['name']);
  }
}
