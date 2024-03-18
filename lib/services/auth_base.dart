import 'package:local_traveler_app/model/UserModel.dart';

abstract class AuthBase {
  Future<UserModel?> currentUser();
  Future<UserModel?> signInWithEmailAndPassword();
  Future<bool> signOut();
}
