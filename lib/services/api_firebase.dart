import '../models/person.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ApiFirebase {
  static Future<void> addPersonToFirestore(PersonModel person) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      await firestore.collection('user').doc(person.id).set(person.toJson());
    } catch (e) {
      print('Error adding person: $e');
    }
  }

  static Future<void> updatePersonInFirestore(PersonModel person) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      DocumentReference docRef =
          firestore.collection('user').doc("isalmde2321sjsdfsdddf4334gdf");
      await docRef.update(person.toJson());
      await docRef.update({'id': person.id});
      print('Person updated successfully!');
    } catch (e) {
      print('Error updating person: $e');
    }
  }

  Stream<QuerySnapshot> streamPersonsFromFirestore() {
    return FirebaseFirestore.instance.collection('user').snapshots();
  }

  // delete user by id
  static Future<void> deleteUserFromFirestore(String id) async {
    FirebaseFirestore.instance.collection('user').doc(id).delete().then((_) {
      // Handle success, maybe show a message or update UI
    }).catchError((error) {
      // Handle errors
      print("Error removing user: $error");
    });
  }
}
