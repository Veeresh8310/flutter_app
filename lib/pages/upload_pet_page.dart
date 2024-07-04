import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app_2/services/firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class UploadPetPage extends StatefulWidget {
  @override
  _UploadPetPageState createState() => _UploadPetPageState();
}

class _UploadPetPageState extends State<UploadPetPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Pet'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Pet Name'),
            ),
            TextField(
              controller: categoryController,
              decoration: InputDecoration(labelText: 'Pet Category'),
            ),
            TextField(
              controller: ageController,
              decoration: InputDecoration(labelText: 'Pet Age'),
            ),
            TextField(
              controller: imageUrlController,
              decoration: InputDecoration(labelText: 'Pet Picture URL'),
            ),
            TextField(
              controller: addressController,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email ID'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final firestoreService = Provider.of<FirestoreService>(context, listen: false);
                await firestoreService.addPet({
                  'name': nameController.text,
                  'category': categoryController.text,
                  'age': int.parse(ageController.text),
                  'imageUrl': imageUrlController.text,
                  'address': addressController.text,
                  'phone': phoneController.text,
                  'email': emailController.text,
                  'created_at': Timestamp.now(),
                });
                Navigator.pop(context);
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
