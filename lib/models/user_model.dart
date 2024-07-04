import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String uid;
  String username;
  String email;
  String phone;
  DateTime createdAt;

  User({
    required this.uid,
    required this.username,
    required this.email,
    required this.phone,
    required this.createdAt,
  });

  factory User.fromMap(Map<String, dynamic> data, String documentId) {
    return User(
      uid: documentId,
      username: data['username'],
      email: data['email'],
      phone: data['phone'],
      createdAt: (data['created_at'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'email': email,
      'phone': phone,
      'created_at': createdAt,
    };
  }
}
