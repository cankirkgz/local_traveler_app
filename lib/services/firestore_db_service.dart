import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:local_traveler_app/model/UserModel.dart';
import 'package:local_traveler_app/services/db_base.dart';

class FirestoreDBService implements DBBase {
  final FirebaseFirestore _firebaseAuth = FirebaseFirestore.instance;

  @override
  Future<bool> saveUser(UserModel user) async {
    await _firebaseAuth.collection("users").doc(user.id).set(user.toMap());
    return true;
  }

  @override
  Future<bool> saveUserDetails(String userId, String name, String city) async {
    try {
      await _firebaseAuth.collection("users").doc(userId).update({
        'name': name,
        'city': city,
      });
      return true;
    } catch (e) {
      print("Kullanıcı bilgileri kaydedilirken hata oluştu: $e");
      return false;
    }
  }
}
