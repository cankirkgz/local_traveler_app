import 'package:firebase_auth/firebase_auth.dart';
import 'package:local_traveler_app/model/UserModel.dart';
import 'package:local_traveler_app/services/auth_base.dart';

class FirebaseAuthService implements AuthBase {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Future<UserModel?> currentUser() async {
    try {
      final User? currentUser = await _firebaseAuth.currentUser;
      if (currentUser == null) {
        throw Exception('Kullanıcı bulunamadı.'); // Throw exception if no user
      } else {
        final user = _userFromFirebase(currentUser);
        return user;
      }
    } catch (e) {
      print(
          "Firebase auth service içindeki current user hata: ${e.toString()}");
      return null; // Hata durumunda null döndür
    }
  }

  UserModel _userFromFirebase(User user) {
    // ignore: unnecessary_null_comparison
    if (user == null) {
      throw Exception('Kullanıcı bulunamadı.'); // Kullanıcı yoksa hata fırlatın
    }
    return UserModel(id: user.uid);
  }

  @override
  Future<UserModel> signInWithEmailAndPassword() {
    // TODO: implement signInWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<bool> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return true;
    } catch (e) {
      print("Firebase auth service içindeki signout hata: ${e.toString()}");
      return false;
    }
  }
}
