import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app_2/services/firestore_service.dart';
import 'upload_pet_page.dart';

class RescuePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firestoreService = Provider.of<FirestoreService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Rescue a Pet'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestoreService.getRescues(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          final pets = snapshot.data!.docs;

          return ListView.builder(
            itemCount: pets.length,
            itemBuilder: (context, index) {
              final pet = pets[index];
              return ListTile(
                title: Text(pet['name']),
                subtitle: Text(pet['category']),
                trailing: Text('${pet['age']} years old'),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UploadPetPage()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
