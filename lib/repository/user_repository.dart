import 'package:local_traveler_app/locator.dart';
import 'package:local_traveler_app/model/UserModel.dart';
import 'package:local_traveler_app/services/auth_base.dart';
import 'package:local_traveler_app/services/firebase_auth_service.dart';
import 'package:local_traveler_app/services/firestore_db_service.dart';

class UserRepository implements AuthBase {
  FirebaseAuthService _firebaseAuthService = locator<FirebaseAuthService>();
  FirestoreDBService _firestoreDBService = locator<FirestoreDBService>();
  @override
  Future<UserModel?> currentUser() async {
    return await _firebaseAuthService.currentUser();
  }

  @override
  Future<UserModel?> signInWithEmailAndPassword(
      String email, String password) async {
    UserModel? _user =
        await _firebaseAuthService.signInWithEmailAndPassword(email, password);
    return await _firestoreDBService.readUser(_user!.id);
  }

  @override
  Future<bool> signOut() async {
    return await _firebaseAuthService.signOut();
  }

  @override
  Future<UserModel?> createUserWithEmailAndPassword(
      String email, String password) async {
    UserModel? _user = await _firebaseAuthService
        .createUserWithEmailAndPassword(email, password);
    bool _result = await _firestoreDBService.saveUser(_user!);
    if (_result) {
      return await _firestoreDBService.readUser(_user.id);
    } else {
      return null;
    }
  }
}
