import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Create or update user
  Future<void> createUser(Map<String, dynamic> data) async {
    return await _db.collection('users').doc(data['uid']).set(data);
  }

  // Get pets
  Stream<QuerySnapshot> getPets() {
    return _db.collection('pets').snapshots();
  }

  // Add pet
  Future<DocumentReference> addPet(Map<String, dynamic> data) async {
    return await _db.collection('pets').add(data);
  }

  // Get adoptions
  Stream<QuerySnapshot> getAdoptions() {
    return _db.collection('adoptions').snapshots();
  }

  // Add adoption
  Future<DocumentReference> addAdoption(Map<String, dynamic> data) async {
    return await _db.collection('adoptions').add(data);
  }

  // Get rescues
  Stream<QuerySnapshot> getRescues() {
    return _db.collection('rescues').snapshots();
  }

  // Add rescue
  Future<DocumentReference> addRescue(Map<String, dynamic> data) async {
    return await _db.collection('rescues').add(data);
  }
}
