import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final userCollection = FirebaseFirestore.instance.collection("users");

  Future<void> registerUser(
      {required String name,
      required String email,
      required String password,
      required String city}) async {
    await userCollection.doc().set({
      "email": email,
      "password": password,
      "name": name,
      "city": city,
      "profileImage": "./assets/icons/person.png",
      "score": 0,
      "ticket": 0,
    });
  }
}
