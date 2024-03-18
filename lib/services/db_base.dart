import 'package:local_traveler_app/model/UserModel.dart';

abstract class DBBase {
  Future<bool> saveUser(UserModel user);
  Future<bool> saveUserDetails(String userId, String name, String city);
}
