import 'package:cloud_firestore/cloud_firestore.dart';

class Pet {
  String id;
  String name;
  String category;
  int age;
  String imageUrl;
  String address;
  String phone;
  String email;
  DateTime createdAt;

  Pet({
    required this.id,
    required this.name,
    required this.category,
    required this.age,
    required this.imageUrl,
    required this.address,
    required this.phone,
    required this.email,
    required this.createdAt,
  });

  factory Pet.fromMap(Map<String, dynamic> data, String documentId) {
    return Pet(
      id: documentId,
      name: data['name'],
      category: data['category'],
      age: data['age'],
      imageUrl: data['imageUrl'],
      address: data['address'],
      phone: data['phone'],
      email: data['email'],
      createdAt: (data['created_at'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'category': category,
      'age': age,
      'imageUrl': imageUrl,
      'address': address,
      'phone': phone,
      'email': email,
      'created_at': createdAt,
    };
  }
}
